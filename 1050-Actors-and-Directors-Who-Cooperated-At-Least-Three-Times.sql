-- Write your PostgreSQL query statement below
SELECT actor_id, director_id
FROM actordirector
GROUP BY actor_id, director_id
Having count(*) >= 3 