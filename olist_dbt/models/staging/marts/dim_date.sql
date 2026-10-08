-- Calendar table covering the full Olist period.
with days as (
    select unnest(generate_series(date '2016-01-01', date '2018-12-31', interval 1 day))::date as date_day
)

select
    date_day,
    year(date_day)                      as year,
    month(date_day)                     as month,
    strftime(date_day, '%b')            as month_name,
    strftime(date_day, '%Y-%m')         as year_month,
    date_trunc('month', date_day)::date as month_start,
    quarter(date_day)                   as quarter,
    isodow(date_day)                    as weekday_number,
    strftime(date_day, '%a')            as weekday_name
from days