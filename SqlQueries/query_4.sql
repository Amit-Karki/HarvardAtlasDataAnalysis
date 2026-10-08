
WITH TopProductExport AS(
         SELECT 
               country_name,
               product_name ,
               year,
               '$ ' || (ROUND((SUM(export_usd) - SUM(import_usd))/1000000000,0)) || ' B' AS TotalTradeSurplus,
               ROW_NUMBER() OVER(
                PARTITION BY country_name,year
                ORDER BY SUM(export_usd) - SUM(import_usd) DESC
               ) AS tt
               FROM countryproductexportdetailstable 
               GROUP by country_name,product_name,year

             )
      

SELECT country_name AS "Country",
       product_name AS "TopProduct",
       TotalTradeSurplus AS "TopProductSurplus",
       year
       FROM TopProductExport WHERE tt = 1 AND year = '2021'
