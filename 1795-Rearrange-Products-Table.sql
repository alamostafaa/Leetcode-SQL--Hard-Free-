-- Write your PostgreSQL query statement below
SELECT Product_id, 'store1' store, store1 price
FROM products
where store1 is not null

union all

SELECT Product_id, 'store2' store, store2 price
FROM products
where store2 is not null

union all

SELECT Product_id, 'store3' store, store3 price
FROM products
where store3 is not null