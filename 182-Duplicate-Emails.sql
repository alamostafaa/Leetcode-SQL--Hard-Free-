-- Write your PostgreSQL query statement below

-- SELECT Distinct email
-- FROM person p
-- where email in (select email from person where id <> p.id)

SELECT distinct email
FROM (
    SELECT email,
       row_number() over(partition by email ) rank
    FROM person
) t
where rank > 1