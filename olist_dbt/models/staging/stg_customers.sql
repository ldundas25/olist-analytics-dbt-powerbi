-- One row per customer_id (which Olist creates per order).
-- customer_unique_id identifies the real person.
select
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
from {{ source('olist', 'olist_customers_dataset') }}