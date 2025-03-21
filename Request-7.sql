/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

SELECT
DATE_FORMAT(date,'%Y-%m') AS Months,s.fiscal_year,
ROUND((SUM(gross_price*sold_quantity)/1000000),2) as gross_sales_amount_mln
FROM dim_customer c
JOIN fact_sales_monthly s
ON c.customer_code = s.customer_code
JOIN fact_gross_price p
ON s.product_code = p.product_code
WHERE customer = "Atliq Exclusive"
GROUP BY s.fiscal_year,Months
ORDER BY s.fiscal_year;
