-- Write your PostgreSQL query statement below
SELECT s.name 
FROM SalesPerson s
WHERE sales_id not in (
    select o.sales_id
        from orders o
        JOIN company c
            ON c.com_id = o.com_id 
        where c.name = 'RED'
    )

