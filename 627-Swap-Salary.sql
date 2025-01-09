-- Write your PostgreSQL query statement below
UPDATE Salary
SET sex = case 
            When sex = 'm' then 'f'
            else 'm'
           end