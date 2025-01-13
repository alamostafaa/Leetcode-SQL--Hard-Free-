-- Write your PostgreSQL query statement below
SELECT u.name, COALESCE(SUM(tr.amount), 0) balance
FROM users u
left Join transactions tr
    on u.account = tr.account
GROUP BY u.name, u.account
Having SUM(tr.amount)  > 10000

