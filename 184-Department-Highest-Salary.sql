-- Write your PostgreSQL query statement below

-- using subquery 

-- SELECT d.name Department, e.name Employee, e.salary Salary
-- FROM employee e
-- JOIN department d
--     ON d.id = e.departmentId
-- WHERE e.salary = (select max(salary) from employee where departmentId = d.id)

-- using window function
WITH empRanked as(
    SELECT name, salary, departmentId,
        Dense_rank() over(partition by departmentId order by salary desc) sal_rank
    FROM employee   
)
SELECT d.name Department, e.name Employee, e.salary Salary 
FROM empRanked e
JOIN department d
    ON d.id = e.departmentId
WHERE sal_rank = 1