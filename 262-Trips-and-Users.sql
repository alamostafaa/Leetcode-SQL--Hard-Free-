-- Write your PostgreSQL query statement below
WITH non_panned_users_trips AS (
    SELECT id, status, request_at
    FROM trips t
    left Join users u
        ON (u.users_id = t.client_id or u.users_id = t.driver_id) 
        AND u.banned = 'Yes'
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
        and users_id is null
)
SELECT request_at \Day\, 
        ROUND(
            SUM(CASE WHEN status like 'cancelled%' THEN 1 ELSE 0 END)::Decimal/
            COUNT(id)
            , 2) \Cancellation Rate\
FROM non_panned_users_trips
GROUP BY request_at
Order by 1 
