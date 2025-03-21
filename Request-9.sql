/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/
 
 WITH cte1 AS (
SELECT c.channel,
round(sum(sold_quantity*gross_price)/1000000,2) as gross_sales_mln
FROM dim_customer c
JOIN fact_sales_monthly s
ON c.customer_code = s.customer_code
JOIN fact_gross_price g
ON s.product_code = g.product_code
WHERE s.fiscal_year = 2021
GROUP BY c.channel)
SELECT channel, gross_sales_mln,
round(gross_sales_mln* 100/ (SELECT sum(gross_sales_mln) FROM cte1),2) AS pct_contribution
FROM cte1
GROUP BY channel;