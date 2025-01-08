CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    SELECT DISTINCT ranked.salary
    FROM (
      SELECT e.salary, DENSE_RANK() OVER (ORDER BY e.salary DESC) AS rank
      FROM Employee e
    ) ranked 
    WHERE ranked.rank = n
  );
END;
$$ LANGUAGE plpgsql;