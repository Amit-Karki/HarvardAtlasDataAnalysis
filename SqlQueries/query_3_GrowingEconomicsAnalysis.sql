
SELECT country_name AS "Country Name",
       eci, 
       coi, 
       export_product_count AS "UniqueItemExported",
       ROUND((projected_growth * 100),2) || ' %' AS "Projected growth"
FROM  HarvardEconomicData
WHERE year = '2021' AND projected_growth IS NOT NULL
ORDER BY projected_growth DESC
LIMIT 10

SELECT country_name AS "Country Name",
       eci, 
       coi, 
       export_product_count AS "UniqueItemExported",
       ROUND((projected_growth * 100),2) || ' %' AS "Projected growth"
FROM  HarvardEconomicData
WHERE year = '2021' AND projected_growth IS NOT NULL
ORDER BY projected_growth ASC
LIMIT 10
