-- Some orders have more than one review.
-- Assumption: keep only the latest review per order.
with ranked as (
    select
        order_id,
        review_score,
        cast(review_answer_timestamp as timestamp) as answered_at,
        row_number() over (
            partition by order_id
            order by cast(review_answer_timestamp as timestamp) desc
        ) as review_rank
    from {{ source('olist', 'olist_order_reviews_dataset') }}
)

select
    order_id,
    review_score,
    answered_at
from ranked
where review_rank = 1