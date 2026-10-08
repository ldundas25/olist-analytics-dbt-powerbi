-- One row per order (all statuses). The main fact table for the dashboard.
-- Items, payments and reviews are aggregated to order level BEFORE joining,
-- so nothing is double-counted.
with orders as (select * from {{ ref('stg_orders') }}),

customers as (select customer_id, customer_unique_id from {{ ref('stg_customers') }}),

items as (
    select
        order_id,
        count(*)           as item_count,
        sum(price)         as revenue,
        sum(freight_value) as freight_value
    from {{ ref('stg_order_items') }}
    group by order_id
),

payments as (
    select order_id, sum(payment_value) as payment_value
    from {{ ref('stg_payments') }}
    group by order_id
),

reviews as (
    select order_id, review_score from {{ ref('stg_reviews') }}
),

joined as (
    select
        o.order_id,
        c.customer_unique_id,
        o.order_status,
        o.order_status = 'delivered'                  as is_delivered,
        o.order_status in ('canceled', 'unavailable') as is_cancelled,
        o.purchased_at::date                          as purchase_date,
        o.purchased_at,
        o.approved_at,
        o.delivered_to_carrier_at,
        o.delivered_to_customer_at,
        o.estimated_delivery_at,
        coalesce(i.item_count, 0)    as item_count,
        coalesce(i.revenue, 0)       as revenue,
        coalesce(i.freight_value, 0) as freight_value,
        p.payment_value,
        r.review_score
    from orders o
    left join customers c on o.customer_id = c.customer_id
    left join items     i on o.order_id = i.order_id
    left join payments  p on o.order_id = p.order_id
    left join reviews   r on o.order_id = r.order_id
)

select
    *,
    -- Delivery metrics in days (with decimals), only where both timestamps exist
    round(date_diff('second', purchased_at, delivered_to_customer_at) / 86400.0, 1)            as delivery_days,
    round(date_diff('second', approved_at, delivered_to_carrier_at) / 86400.0, 1)              as seller_handling_days,
    round(date_diff('second', delivered_to_carrier_at, delivered_to_customer_at) / 86400.0, 1) as carrier_transit_days,
    case
        when is_delivered and delivered_to_customer_at is not null
        then delivered_to_customer_at::date <= estimated_delivery_at::date
    end                                                                                         as is_on_time,
    -- 1 = customer's first delivered order, 2 = second, ... (for repeat-purchase analysis)
    case
        when is_delivered
        then row_number() over (partition by customer_unique_id, is_delivered order by purchased_at)
    end                                                                                         as customer_order_number
from joined