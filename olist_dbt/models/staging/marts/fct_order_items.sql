-- One row per item. Used for category, seller and region analysis.
with items as (
    select * from {{ ref('stg_order_items') }}
),

orders as (
    select order_id, customer_unique_id, order_status, is_delivered, purchase_date, delivery_days
    from {{ ref('fct_orders') }}
),

sellers as (
    select seller_id, seller_state from {{ ref('stg_sellers') }}
),

customers as (
    select customer_unique_id, customer_state from {{ ref('dim_customer') }}
)

select
    i.order_id || '-' || i.order_item_id        as order_item_key,
    i.order_id,
    i.order_item_id,
    i.product_id,
    i.seller_id,
    o.customer_unique_id,
    o.order_status,
    o.is_delivered,
    o.purchase_date,
    i.price,
    i.freight_value,
    o.delivery_days,
    s.seller_state || ' → ' || c.customer_state as route
from items i
join orders         o on i.order_id = o.order_id
left join sellers   s on i.seller_id = s.seller_id
left join customers c on o.customer_unique_id = c.customer_unique_id