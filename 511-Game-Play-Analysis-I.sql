-- Write your PostgreSQL query statement below
SELECT player_id, min(event_date) first_login
FROM activity
GROUP BY player_id