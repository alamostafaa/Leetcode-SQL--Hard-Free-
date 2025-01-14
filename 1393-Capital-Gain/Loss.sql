-- Write your PostgreSQL query statement below
WITH ranked_op as (
    SELECT stock_name, operation, price,
            ROW_NUMBER() OVER (PARTITION BY stock_name, operation order by operation_day) rank
    FROM stocks b
)
SELECT b.stock_name, SUM(s.price - b.price) capital_gain_loss
FROM ranked_op b
JOIN ranked_op s
    ON b.stock_name = s.stock_name AND b.rank= s.rank and s.operation = 'Sell'
where b.operation = 'Buy'
GROUP BY b.stock_name


