-- Views created for Power BI import.
-- Each view exposes pre-aggregated, business-question-specific data,
-- keeping this logic in PostgreSQL rather than duplicating it in Power Query/DAX.

-- Question 1: Profitability by category and sub-category
CREATE VIEW vw_category_profitability AS
SELECT
    category,
    sub_category,
    COUNT(*) AS orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM superstore_cleaned
GROUP BY category, sub_category;


-- Question 2: Discount vs. profit, bucketed
CREATE VIEW vw_discount_profitability AS
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
GROUP BY discount_bucket;


-- Supporting view for the drill-through page: sub-category discount sensitivity
CREATE VIEW vw_subcategory_discount AS
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
GROUP BY sub_category, discount_bucket;


-- Question 3: Market/region performance
CREATE VIEW vw_market_region_performance AS
SELECT
    market,
    region,
    COUNT(*) AS orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM superstore_cleaned
GROUP BY market, region;


-- Verification: confirm each view returns expected results
SELECT * FROM vw_category_profitability ORDER BY total_profit;
SELECT * FROM vw_discount_profitability ORDER BY discount_bucket;
SELECT * FROM vw_subcategory_discount ORDER BY discount_bucket, avg_profit DESC;
SELECT * FROM vw_market_region_performance ORDER BY profit_margin_pct DESC;