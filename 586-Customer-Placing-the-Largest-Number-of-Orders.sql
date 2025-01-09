-- Write your PostgreSQL query statement below
SELECT customer_number
FROM orders
GROUP BY customer_number
Order by count(order_number) DESC
Limit 1