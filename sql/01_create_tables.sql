-- Create raw table
-- The source CSV had inconsistent numeric formatting (commas in 
-- sales/profit/shipping_cost) and dates that failed strict DATE/NUMERIC 
-- parsing during import. Landing everything as text avoids import failures 
-- and lets us clean/cast deliberately in a later, controlled step.

CREATE TABLE superstore_raw (
    order_id VARCHAR(20),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    state VARCHAR(100),
    country VARCHAR(100),
    market VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales VARCHAR(20),
    quantity VARCHAR(20),
    discount VARCHAR(20),
    profit VARCHAR(20),
    shipping_cost VARCHAR(20),
    order_priority VARCHAR(20),
    year VARCHAR(10)
);
