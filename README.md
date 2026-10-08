# olist-analytics-dbt-powerbi
An e-commerce performance and delivery analytics model, built on the Brazilian Olist dataset

96,478 of 99,441 orders (97%) were delivered, and about 1.2% were cancelled or unavailable.

Q1, late deliveries vs reviews:

Of 96,470 delivered orders with a delivery date, 93.2% arrived on time and 6.8% were late.
On-time orders average 4.29 stars; late orders average 2.27 stars. That's 2 points lower, on a 1–5 scale.
The blank row (8 orders) is orders marked "delivered" but with no delivery date, so on-time can't be calculated. That's a small data quality finding; note it in your README.

Q2, revenue and AOV: size of the business:

Revenue 13.2 million across 96,478 delivered orders, AOV 137.04.
Olist is Brazilian, so these are Brazilian reais (BRL), not euros or DKK. Label them R$ in Power BI and the README. Reviewers notice a missing currency.

Q3, repeat customers:

Only 2,801 of 93,358 customers (3.0%) bought more than once.
Implication: the business depends almost entirely on new customers, so the first order is effectively the only chance to make a good impression. That links Q3 back to Q1: late deliveries damage the one experience most customers ever have.

One point to raise in interviews before someone else does: Q1 shows a correlation, not proof that lateness causes bad reviews. Late orders might also differ in other ways, such as region or product category. A good way to put it: "Late orders score 2 points lower; the next step would be to check whether that holds within the same region and category." That shows analytical maturity.