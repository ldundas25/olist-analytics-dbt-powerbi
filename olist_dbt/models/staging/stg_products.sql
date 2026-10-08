-- Adds the English category name. Products without a category get 'unknown'.
with products as (
    select * from {{ source('olist', 'olist_products_dataset') }}
),

translation as (
    select * from {{ source('olist', 'product_category_name_translation') }}
)

select
    products.product_id,
    coalesce(translation.product_category_name_english,
             products.product_category_name,
             'unknown')                      as product_category,
    products.product_weight_g                as weight_g
from products
left join translation
    on products.product_category_name = translation.product_category_name