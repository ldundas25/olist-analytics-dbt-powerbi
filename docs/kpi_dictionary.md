# KPI Dictionary – Olist E-commerce Analytics

## Business questions
1. Are late deliveries lowering our customers' review scores?
2. How is the business growing month by month, and is growth driven by more orders or by bigger baskets?
3. What brings customers back? Do customers whose first order arrived on time and was rated highly buy again more often?
4. Where in the delivery process are delays created: seller handling (approval → handed to carrier) or carrier transit (carrier → customer)?
5. Which seller-to-customer regions have the longest delivery times and the highest freight cost relative to price?

## KPIs

| KPI | Definition | Formula | Grain | Source | Caveats |
|---|---|---|---|---|---|
| On-time delivery % | Share of delivered orders that arrived by the estimated date | Delivered orders where delivered_customer_date <= estimated_delivery_date ÷ delivered orders | Order | Orders | Excludes cancelled/undelivered orders |
| Revenue | | | | | |
| Orders | | | | | |
| Average order value (AOV) | | | | | |
| Avg review score | | | | | |
| Repeat-customer rate | | | | | |
| Items per order (for Q2) | | | | | |
| Avg delivery days, Seller handling days and Carrier transit days (for Q4) | | | | | |
| Freight share of price = freight ÷ item price (for Q5) | | | | | |


## Key decisions
- 

Two notes for later

Q3: as far as I remember, repeat purchases in Olist are very rare (only a few percent of customers). If your numbers confirm that, it's a finding in itself, for example: "the business depends almost entirely on new customers, so first-order experience matters."
Q4 and Q5 draw on your Pandora logistics experience, so you'll be able to talk about them with real context in interviews.