-- Profitability by Category/Sub-category
SELECT
    category,
    sub_category,
    COUNT(*) AS orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM superstore_cleaned
GROUP BY category, sub_category
ORDER BY orders;
-- Tables are the only sub-category with negative total profit, even though they generate
-- a high sales volume. This suggests that table sales are being driven by strong demand,
-- but margins are being eroded by costs or discounting. Tables also have the lowest order count,
-- which indicates they are not as frequently ordered as other categories and may require pricing
-- or margin review.

-- Discount vs. Profit
SELECT
    CASE WHEN discount = 0 THEN '0%'
    WHEN discount <= 0.1 THEN '1-10%'
    WHEN discount <= 0.2 THEN '11-20%'
    WHEN discount <= 0.3 THEN '21-30%'
    WHEN discount <= 0.4 THEN '31-40%'
    WHEN discount <= 0.5 THEN '41-50%'
    ELSE '50%+' END AS discount_bucket,
    COUNT(*) AS orders,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM superstore_cleaned
GROUP BY discount_bucket
ORDER BY discount_bucket;
-- Profitability declines as discount rates increase. Once discounts reach the 21-30% bucket,
-- some products start to generate losses, and at discount levels above 30%, most products
-- are operating at a loss. This highlights that discounts are not always beneficial and can
-- quickly erode profitability if not tightly controlled.

-- Sub-category and discount sensitivity:
SELECT
    sub_category,
    CASE WHEN discount = 0 THEN '0%'
    WHEN discount <= 0.1 THEN '1-10%'
    WHEN discount <= 0.2 THEN '11-20%'
    WHEN discount <= 0.3 THEN '21-30%'
    WHEN discount <= 0.4 THEN '31-40%'
    WHEN discount <= 0.5 THEN '41-50%'
    ELSE '50%+' END AS discount_bucket,
    COUNT(*) AS orders,
    SUM(sales) AS total_sales,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM superstore_cleaned
GROUP BY sub_category, discount_bucket
ORDER BY discount_bucket, avg_profit DESC;
-- Tables perform best at discount levels between 0% and 10%. Beyond this range, profit
-- begins to fall sharply, which explains why Tables are the only sub-category with negative
-- total profit. This suggests that Table pricing and discount strategy should be optimized
-- to keep discounts low and avoid margin compression.
-- Market/Region Performance

SELECT 
    market,
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) /NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM superstore_cleaned
GROUP BY market, region
ORDER BY profit_margin_pct DESC;

SELECT market, region, COUNT(*) AS orders FROM superstore_cleaned GROUP BY market, region ORDER BY orders ASC;
-- The EU market has the highest sales volume and the highest total profit, making it the
-- strongest region in absolute terms. Canada has the highest profit margin percentage, but
-- its lower order volume suggests that its stronger margin is driven by a smaller, more
-- selective customer base rather than scale. This indicates that growth strategies should
-- be tailored by region: scale in EU and margin protection in Canada.
