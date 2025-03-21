/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

WITH cte1 AS( 
SELECT 
segment,
COUNT(DISTINCT(CASE WHEN fiscal_year = 2020 THEN s.product_code END)) AS unique_products_2020,
COUNT(DISTINCT(CASE WHEN fiscal_year = 2021 THEN s.product_code END)) AS unique_products_2021
FROM dim_product p
JOIN fact_sales_monthly s
ON p.product_code = s.product_code
GROUP BY segment)
SELECT
segment,
unique_products_2020,
unique_products_2021,
unique_products_2021-unique_products_2020 AS difference
FROM cte1
ORDER BY difference desc;