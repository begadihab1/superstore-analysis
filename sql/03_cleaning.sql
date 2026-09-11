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

-- Verification
SELECT COUNT(*) FROM superstore_cleaned;
SELECT * FROM superstore_cleaned LIMIT 10;
SELECT COUNT(*) FROM superstore_cleaned WHERE order_date IS NULL OR ship_date IS NULL;
SELECT COUNT(*) FROM superstore_cleaned WHERE ship_date < order_date;

-- Checking for whitesapses
SELECT product_name
FROM superstore_cleaned
WHERE product_name != TRIM(product_name);

-- Trimming the records with whitespaces found in product_name
UPDATE superstore_cleaned
SET product_name = TRIM(product_name)
WHERE product_name != TRIM(product_name);

-- Checking for misspellings / inconsistency
SELECT DISTINCT state
FROM superstore_cleaned
WHERE state LIKE 'T%'
ORDER BY state ASC;

-- Fixing misspellings / inconsistency
UPDATE superstore_cleaned
SET state = 'Adamawa' 
WHERE state = 'Adamaoua';

UPDATE superstore_cleaned
SET state = 'Bolívar' 
WHERE state = 'Bolivar';

UPDATE superstore_cleaned
SET state = 'Lima'
WHERE state = 'Lima (city)';

UPDATE superstore_cleaned
SET state = 'Tỉnh Cần Thơ'
WHERE state = 'T?nh C?n Th?';

UPDATE superstore_cleaned
SET state = 'Thủ Dô Hà Nội'
WHERE state = 'Th? Dô Hà N?i';

-- Checking sales and quantity
SELECT COUNT(*)
FROM superstore_cleaned
WHERE sales <= 0;

-- Removing rows with zero or negative values
DELETE FROM superstore_cleaned
WHERE sales <= 0;

-- Verification
SELECT COUNT(*)
FROM superstore_cleaned;
