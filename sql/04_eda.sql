-- Time Range
SELECT MIN(order_date), MAX(order_date)
FROM superstore_cleaned;

-- Checking Numeric Ranges
SELECT 
    MIN(sales) AS min_sales, 
    MAX(sales) AS max_sales, 
    AVG(sales) AS avg_sales, 
    MIN(profit) AS min_profit, 
    MAX(profit) AS max_profit, 
    AVG(profit) AS avg_profit,
    MIN(discount)AS min_discount,
    MAX(discount)AS max_discount,
    AVG(discount)AS avg_discount
FROM superstore_cleaned;

-- Years and Orders
SELECT year, COUNT(*) AS orders
FROM superstore_cleaned
GROUP BY year
ORDER BY year;

-- Exploring the numbers with years and months
SELECT
    year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS sum_sales,
    ROUND(AVG(sales), 2) AS avg_sales,
    ROUND(AVG(discount), 2) AS avg_discount,
    SUM(profit) AS sum_profit,
    ROUND(AVG(profit), 2) AS avg_profit
FROM superstore_cleaned
GROUP BY year, month
ORDER BY year, month;

-- Exploring the numbers with products, market and countries
SELECT 
    year,
    category, 
    COUNT(*) AS orders, 
    SUM(sales) AS sum_sales,
    SUM(profit) AS sum_profit
FROM superstore_cleaned
GROUP BY year, category
ORDER BY year, sum_profit DESC;


SELECT 
    market,
    COUNT(*) AS orders,
    SUM(sales) AS sum_sales,
    SUM(profit) AS sum_profit
FROM superstore_cleaned
GROUP BY market
ORDER BY SUM(sales) DESC;

SELECT
    market,
    category,
    COUNT(*) AS orders,
    SUM(sales) AS sum_sales,
    SUM(profit) AS sum_profit
FROM superstore_cleaned
GROUP BY market, category
ORDER BY category DESC, sum_sales DESC;

SELECT
    country,
    SUM(sales) AS sum_sales,
    ROUND(AVG(sales), 2) AS avg_sales,
    SUM(profit) AS sum_profit
FROM superstore_cleaned
GROUP BY country
ORDER BY sum_sales DESC
LIMIT 10;

SELECT 
    market,
    category,
    COUNT(*) AS orders,
    ROUND(
        COUNT(*) * 100.0
        / SUM(COUNT(*)) OVER (PARTITION BY market),
        2
    ) AS orders_perc
FROM superstore_cleaned
GROUP BY market, category;

SELECT
    country,
    category,
    COUNT(*) AS orders,
    ROUND(
        COUNT(*) * 100.0
        / SUM(COUNT(*)) OVER(PARTITION BY country),
        2
    ) AS category_perc
FROM superstore_cleaned
WHERE country IN ('United States', 'Canada', 'United Kingdom', 'China')
GROUP BY country, category;

SELECT
    category,
    sub_category,
    COUNT(DISTINCT product_id) AS num_products,
    SUM(sales) AS sum_sales,
    SUM(profit) AS sum_profit,
    ROUND(AVG(discount), 2) AS avg_discount
FROM superstore_cleaned
GROUP BY category, sub_category
ORDER BY category, sum_sales;

SELECT 
    ROUND(discount, 2) AS discount_level,
    COUNT(*),
    AVG(profit) AS avg_profit
FROM superstore_cleaned
GROUP BY ROUND(discount, 2)
ORDER BY discount_level;
