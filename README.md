# 📊 Task 6 — Sales Trend Analysis Using SQL

### 🎯 Objective
Analyze **monthly revenue** and **order volume** using SQL aggregate functions.

---

### 📂 Dataset
**Table:** `online_sales`  
Fields:
| Column | Type | Description |
|--------|------|-------------|
| order_id | INT | Unique order ID |
| order_date | DATE | Order date |
| product_id | INT | Product identifier |
| amount | DECIMAL | Order value |

---

### 🛠 SQL Concepts Used
- `EXTRACT()` — extract month & year from date
- `SUM()` — total revenue
- `COUNT(DISTINCT)` — number of unique orders
- `GROUP BY` — group results by month/year
- `ORDER BY` — sort output

---

### ✅ SQL Script

```sql
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

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

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month
LIMIT 5;
