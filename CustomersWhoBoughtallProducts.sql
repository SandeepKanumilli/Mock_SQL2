# Write your MySQL query statement below
  WITH CTE AS (
    SELECT customer_id,COUNT( DISTINCT product_key) as 'count' FROM Customer 
GROUP BY customer_id)
 

SELECT customer_id FROM CTE WHERE count = (SELECT COUNT(product_key) as pdcount from Product )