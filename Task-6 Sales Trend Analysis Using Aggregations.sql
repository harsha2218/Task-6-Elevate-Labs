CREATE TABLE online_sales (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    product_id INT NOT NULL
);

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

SELECT * FROM online_sales;

--Monthly Sales Trend
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
	AVG(amount) AS avg_order_value  
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

--Only Year 2025
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    AVG(amount) AS avg_order_value
FROM online_sales
WHERE EXTRACT(YEAR FROM order_date) = 2025   -- Limit to 2025
GROUP BY year, month
ORDER BY year, month;

--Between March to May in 2024
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    AVG(amount) AS avg_order_value
FROM online_sales
WHERE order_date BETWEEN '2024-03-01' AND '2024-05-31'  -- Limit to Mar–May 2024
GROUP BY year, month
ORDER BY year, month;