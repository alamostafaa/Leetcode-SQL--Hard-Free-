-- Write your PostgreSQL query statement below
SELECT score, 
        dense_rank() over (order by score DESC) rank 
FROM scores
Order by score DESC