# 📊 Task 6: Sales Trend Analysis Using Aggregations

## 📌 Objective
The objective of this task is to analyze **monthly revenue** and **order volume** from the `online_sales` dataset using **PostgreSQL aggregations**.  

This analysis helps understand:
- **Revenue trends** over time  
- **Order volume** per month  
- **Average Order Value (AOV)** (i.e., revenue per order)  
- Filtering for specific time periods (e.g., year 2025)

---

## 🛠 Tools & Dataset
- **Database**: PostgreSQL  
- **Table**: `online_sales`  
  - Columns: `order_id`, `order_date`, `amount`, `product_id`
 

## 🔑 SQL Techniques Used
- `EXTRACT(YEAR/MONTH FROM order_date)` → Extracts year & month  
- `SUM(amount)` → Total revenue  
- `COUNT(DISTINCT order_id)` → Order volume  
- `AVG(amount)` → Average Order Value (AOV)  
- `GROUP BY` → Aggregates data by year & month  
- `ORDER BY` → Sorts results chronologically  
- `WHERE` clause → Limits results to specific time periods  

### 📂 Dataset Creation
```sql
-- Create table
CREATE TABLE online_sales (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    product_id INT NOT NULL
);

-- Insert mock sales data
INSERT INTO online_sales (order_date, amount, product_id) VALUES
('2024-01-15', 250.00, 101),
('2024-01-22', 150.00, 102),
('2024-02-05', 400.00, 103),
('2024-02-20', 200.00, 101),
('2024-03-10', 300.00, 104),
('2024-03-18', 180.00, 102),
('2024-04-02', 500.00, 105),
('2024-04-15', 220.00, 101),
('2024-05-08', 350.00, 103),
('2024-05-20', 270.00, 104),
('2025-01-12', 600.00, 101),
('2025-01-25', 320.00, 106),
('2025-02-14', 450.00, 107),
('2025-02-28', 380.00, 102),
('2025-03-06', 520.00, 108),
('2025-03-22', 290.00, 105);
```
## 📜 Query Example
```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    AVG(amount) AS avg_order_value
FROM online_sales
WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY year, month
ORDER BY year, month;
```
## ✅ Insights
- Revenue trend: Total revenue fluctuates month by month.
- Order volume: Shows how many transactions occurred each month.
- AOV: Provides insights into average customer spend.
- Limiting results to 2025 helps focus analysis on the latest period.

## 📂 Files

- `Task-6 Sales Trend Analysis Using Aggregations.sql`  
  SQL script used to perform the sales trend analysis
- `screenshots/`  
  JPG file containing screenshots of the results obtained after running the SQL queries.
