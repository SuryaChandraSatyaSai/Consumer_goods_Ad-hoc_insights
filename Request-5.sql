/*5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost*/
(SELECT
p.product_code,
p.product, 
manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
ON p.product_code = m.product_code
ORDER BY manufacturing_cost DESC
LIMIT 1)
UNION 
(SELECT
p.product_code,p.product, manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
ON p.product_code = m.product_code
ORDER BY manufacturing_cost ASC
LIMIT 1);