-- Write your PostgreSQL query statement below
SELECT  id, visit_date, people
-- select *
FROM (
    SELECT  *, 
            lead(id, 1) over() nxt1,
            lead(id, 2) over() nxt2,
            lag(id, 1) over() prev1,
            lag(id, 2) over() prev2
    FROM stadium
    WHERE people >= 100
) tb
where (id + 1 = nxt1 and id + 2 = nxt2)
    or (id - 1 = prev1 and id - 2 = prev2)
    or (id + 1 = nxt1 and id - 1 = prev1)
ORDER BY visit_date