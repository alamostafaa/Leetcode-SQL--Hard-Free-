-- Write your PostgreSQL query statement below
SELECT c.name customers
FROM customers c
left Join orders o
    on c.id = o.customerId
where o.id is null