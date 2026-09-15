-- Profitability by Category/Sub-category
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM superstore_cleaned
GROUP BY category, sub_category
ORDER BY profit_margin_pct;
-- Tables are the only sub-category with negative total profit, despite high sales volume

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

-- To know which sub-category needs modification in discount and which makes a huge loss
-- and should reduce the discount to specific discount bucket to make profit
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
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM superstore_cleaned
GROUP BY sub_category, discount_bucket
ORDER BY discount_bucket;
-- Entering the 21-30% discount area begins to make losses for some products and by increasing discount rate over 30% all products are losing.
-- Tables performs best from 0-10% discount rate and after that rate it begins to fall down.
-- That is the reason why tables are the only sub-category with negative total profit.
-- Suplies are similar to tables in performance. 
-- Althought it starts to fall after entering the 21-30% discount area, it does not generate loss.
-- However, this is because its sales volume are less then tables,
-- and I think if its sales volume is similar to tables sales volume it would have a negative total profit.

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
-- EU market has the highest sales volume and the highest total profit with average profit margin percentage
-- Canada has the highest profit margin percentage, yet it has the lowest sales volume and total profit

