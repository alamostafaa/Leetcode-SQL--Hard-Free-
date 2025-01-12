-- Write your PostgreSQL query statement below
SELECT DISTINCT u.user_id buyer_id,
        join_date,
        count(order_id) over(partition by o.buyer_id) orders_in_2019
FROM users u
left JOIN orders o
    ON u.user_id = o.buyer_id and to_char(o.order_date, 'yyyy') = '2019'
order by 1
