-- Write your PostgreSQL query statement below
SELECT e.name Employee
FROM Employee e
Join Employee m
    ON m.id = e.managerId
where e.salary > m.salary