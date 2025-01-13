-- Write your PostgreSQL query statement below
SELECT u.name, COALESCE(sum(r.distance), 0) travelled_distance
FROM users u
left join rides r
    on u.id = user_id
group by u.name, u.id
order by travelled_distance DESC, u.name