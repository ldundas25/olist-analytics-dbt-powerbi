# KPI Dictionary – Olist E-commerce Analytics

## Business questions
1. Are late deliveries lowering our customers' review scores?
2. How is the business growing month by month, and is growth driven by more orders or by bigger baskets?
3. What brings customers back? Do customers whose first order arrived on time and was rated highly buy again more often?
4. Where in the delivery process are delays created: seller handling (approval → handed to carrier) or carrier transit (carrier → customer)?
5. Which seller-to-customer regions have the longest delivery times and the highest freight cost relative to price?

## KPIs

| KPI | Definition | Formula | Grain | Source | Caveats |
| Revenue | Value of items sold in delivered orders, excluding freight | SUM(price) | Order item | order_items, orders | Q2 |
| Orders | Number of delivered orders | COUNT(DISTINCT order_id) | Order | orders | Q2 |
| Average order value (AOV) | Average revenue per delivered order | Revenue ÷ Orders | Order | order_items, orders | Q2 |
| Items per order | Average number of items in a delivered order | COUNT(order_item_id) ÷ Orders | Order | order_items | Q2 |
| On-time delivery % | Share of delivered orders that arrived by the estimated date | Orders where delivered_customer_date ≤ estimated_delivery_date ÷ Orders | Order | orders | Q1, Q4 |
| Avg delivery days | Average days from purchase to delivery | AVG(delivered_customer_date − purchase_timestamp) | Order | orders | Q4, Q5 |
| Seller handling days | Average days from payment approval to handover to carrier | AVG(delivered_carrier_date − approved_at) | Order | orders | Q4 |
| Carrier transit days | Average days from carrier handover to customer delivery | AVG(delivered_customer_date − delivered_carrier_date) | Order | orders | Q4 |
| Freight share of price | Freight cost relative to item value | SUM(freight_value) ÷ SUM(price) | Order item | order_items | Q5 |
| Avg review score | Average review score (1–5) of delivered orders with a review | AVG(review_score) | Order | reviews, orders | Q1, Q3 |
| Repeat-customer rate | Share of customers with 2+ delivered orders | Customers with ≥2 orders ÷ customers with ≥1 order | Customer | orders, customers | Q3 |
| Cancellation rate | Share of all orders cancelled or unavailable | Orders with status canceled/unavailable ÷ all orders | Order | orders | Context |


## Definitions & assumptions
- **Revenue:** item price only, excluding freight. Freight is passed on to logistics providers, so it isn't marketplace income; it's tracked separately as freight share.
- **Orders included:** only `delivered` orders for revenue, delivery and review KPIs. Cancelled/unavailable orders are tracked in the cancellation rate.
- **Customer identifier:** `customer_unique_id`, because `customer_id` is created per order and would hide repeat buyers.
- **Reporting date:** purchase date (`order_purchase_timestamp`), since it reflects when demand happened.
- **Reviews:** if an order has several reviews, the latest one is used. Orders without a review are excluded from the average score.
- **Days:** differences are calculated in days between timestamps. Orders with missing delivery dates are excluded from delivery KPIs.

----- 
Two notes for later

Q3: as far as I remember, repeat purchases in Olist are very rare (only a few percent of customers). If your numbers confirm that, it's a finding in itself, for example: "the business depends almost entirely on new customers, so first-order experience matters."
Q4 and Q5 draw on your Pandora logistics experience, so you'll be able to talk about them with real context in interviews.

**Geolocation data:** not used in this version. Regional analysis is done at state level using customer and seller states. The geolocation file has multiple coordinates per zip code and would need deduplication; seller-to-customer distance is a possible extension.