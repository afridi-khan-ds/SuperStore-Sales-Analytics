CREATE TABLE superstore_sales (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    segment VARCHAR(50),
    region VARCHAR(50),
    state VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales NUMERIC,
    profit NUMERIC,
    payment_mode VARCHAR(50)
);

-- Total Sales
SELECT SUM(sales) AS total_sales
FROM superstore_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales;

-- Total Profit
SELECT SUM(profit) AS total_profit
FROM superstore_sales;

-- Average Delivery Days
SELECT AVG(ship_date - order_date) AS avg_delivery_days
FROM superstore_sales;

-- Sales by Payment Mode
SELECT payment_mode,
       SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY payment_mode;

-- Sales by Region
SELECT region,
       SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY region;

-- Sales by Segment
SELECT segment,
       SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY segment;

-- Monthly Sales Trend (YoY)
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY year, month
ORDER BY year, month;

-- Monthly Profit Trend (YoY)
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY year, month
ORDER BY year, month;

-- Sales by Ship Mode
SELECT ship_mode,
       SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- Sales by Category
SELECT category,
       SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY category;

-- Sales by Sub-Category
SELECT sub_category,
       SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY sub_category
ORDER BY total_sales DESC;

-- Sales by State(Map)
SELECT state,
       SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY state;

