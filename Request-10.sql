/*10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order*/ 

WITH cte1 AS (
SELECT
c.product_code, division, product, sum(sold_quantity) AS total_sold_quantity,
DENSE_RANK() OVER (PARTITION BY division ORDER BY sum(sold_quantity) DESC) AS rank_order
FROM dim_product c
JOIN fact_sales_monthly s
ON c.product_code = s.product_code
WHERE fiscal_year = 2021
GROUP BY division,c.product_code,product)
SELECT * FROM cte1
WHERE rank_order <4;