-- Write your PostgreSQL query statement below
WITH child_count as (
    SELECT p_id, count(*)
    FROM tree
    group by p_id
)
select t.id, 
        CASE
            WHEN t.p_id is null then 'Root' -- no parent
            WHEN cc.count is null then 'Leaf'-- no childern
            else 'Inner' -- has a parent and childern
        END \type\
from tree t
left join child_count cc
    on cc.p_id = t.id 