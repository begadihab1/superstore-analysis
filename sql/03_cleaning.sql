CREATE TABLE superstore_cleaned AS
SELECT
    order_id,
    TO_DATE(order_date, 'DD-MM-YYYY') AS order_date,
    TO_DATE(ship_date, 'DD-MM-YYYY') AS ship_date,
    ship_mode,
    customer_name,
    segment,
    state,
    country,
    market,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    REPLACE(sales, ',', '')::NUMERIC(10, 2) AS sales,
    quantity::INTEGER,
    discount::NUMERIC(5, 2) AS discount,
    REPLACE(profit, ',', '')::NUMERIC(10, 2) AS profit,
    REPLACE(shipping_cost, ',', '')::NUMERIC(10, 2) AS shipping_cost,
    order_priority,
    year::INTEGER
FROM superstore_raw;

-- VERIFICATION
SELECT COUNT(*) FROM superstore_cleaned;
SELECT COUNT(*) FROM superstore_cleaned WHERE order_date IS NULL OR ship_date IS NULL;
SELECT COUNT(*) FROM superstore_cleaned WHERE ship_date < order_date;

-- CLEANING
SELECT ship_mode
FROM superstore_cleaned
WHERE ship_mode != TRIM(ship_mode);
