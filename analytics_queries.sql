-- Question 1: Regional Performance
SELECT region,
       SUM(sales_amount) AS total_revenue,
       COUNT(*) AS total_transactions,
       AVG(sales_amount) AS avg_transaction_value
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Question 2: Discount Impact
SELECT
    CASE
        WHEN discount <= 0.10 THEN 'Low (0-10%)'
        WHEN discount <= 0.20 THEN 'Medium (11-20%)'
        WHEN discount <= 0.30 THEN 'High (21-30%)'
    END AS discount_range,
    AVG(sales_amount - (unit_cost * quantity_sold)) AS avg_profit,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY discount_range
ORDER BY discount_range;

-- Question 3: Customer Type Behavior
SELECT customer_type,
       AVG(sales_amount) AS avg_spending,
       COUNT(*) AS total_transactions
FROM sales
GROUP BY customer_type;

-- Question 4: Monthly Revenue Trend
SELECT EXTRACT(month FROM sale_date::date) AS month,
       SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Question 4b: Sales by Day of Week
SELECT EXTRACT(dow FROM sale_date::date) AS day_of_week,
       COUNT(*) AS total_transactions
FROM sales
GROUP BY day_of_week
ORDER BY day_of_week;

-- Question 5: Channel vs Payment Method
SELECT payment_method,
       sales_channel,
       AVG(sales_amount) AS avg_transaction_value
FROM sales
GROUP BY payment_method, sales_channel
ORDER BY avg_transaction_value DESC;