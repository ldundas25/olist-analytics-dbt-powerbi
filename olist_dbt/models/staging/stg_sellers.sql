select
    seller_id,
    seller_city,
    seller_state
from {{ source('olist', 'olist_sellers_dataset') }}