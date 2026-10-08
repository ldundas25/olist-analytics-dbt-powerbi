-- One row per real customer (customer_unique_id).
-- Location is taken from the customer's most recent order.
with customer_orders as (
    select
        c.customer_unique_id,
        c.customer_city,
        c.customer_state,
        o.purchased_at
    from {{ ref('stg_customers') }} as c
    join {{ ref('stg_orders') }} as o on c.customer_id = o.customer_id
)

select
    customer_unique_id,
    arg_max(customer_city,  purchased_at) as customer_city,
    arg_max(customer_state, purchased_at) as customer_state,
    min(purchased_at)::date               as first_purchase_date
from customer_orders
group by customer_unique_id