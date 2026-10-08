# olist-analytics-dbt-powerbi
An e-commerce performance and delivery analytics model, built on the Brazilian Olist dataset

96,478 of 99,441 orders (97%) were delivered, and about 1.2% were cancelled or unavailable.

Q1, late deliveries vs reviews:

Of 96,470 delivered orders with a delivery date, 93.2% arrived on time and 6.8% were late.
On-time orders average 4.29 stars; late orders average 2.27 stars. 2 points lower, on a 1–5 scale.
8 orders are marked "delivered" but with no delivery date, so on-time can't be calculated.

This shows a correlation, not proof that lateness causes bad reviews.
Late orders might also differ in other ways, such as region or product category. As a next step, it would be interesting to check whether this holds within the same region and category.

Q2, revenue and AOV: size of the business:

Revenue 13.2 million BRL (Brazilian Reais) across 96,478 delivered orders, AOV 137.04 BRL.

Q3, repeat customers:

Only 2,801 of 93,358 customers (3.0%) bought more than once.
The business depends almost entirely on new customers, so the first order is effectively the only chance to make a good impression. Linking Q3 to Q1: late deliveries damage the one experience most customers ever have.
