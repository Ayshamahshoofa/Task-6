-- ✅ Task 6: Sales Trend Analysis Using Aggregations
-- Database: MySQL
-- Table: online_sales

-- Step 1: Create Table
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

-- Step 2: Insert Sample Data (10 rows)
INSERT INTO online_sales (order_id, order_date, product_id, amount) VALUES
(1, '2024-01-05', 101, 450.00),
(2, '2024-01-18', 102, 699.00),
(3, '2024-02-06', 103, 1100.00),
(4, '2024-02-14', 104, 350.00),
(5, '2024-03-03', 105, 800.00),
(6, '2024-03-22', 101, 980.00),
(7, '2024-04-10', 102, 1200.00),
(8, '2024-04-25', 103, 700.00),
(9, '2024-05-12', 104, 1500.00),
(10,'2024-05-30', 105, 650.00);

-- Step 3: View all data
SELECT * FROM online_sales;

-- Step 4: Monthly Sales Trend Analysis
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month
LIMIT 5;
