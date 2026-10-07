
SELECT 
       country_name AS "Country Name",
       (
        SELECT product_name
        FROM (
            SELECT iso3_code,
                   product_name,
                   ROW_NUMBER() OVER(
                    PARTITION BY iso3_code
                    ORDER BY COUNT(*) DESC
                   ) AS MPR
                   FROM CountryProductExportDetailsTable i
                   WHERE i.country_name = O.country_name AND year = '2021'
                   GROUP BY iso3_code,product_name
        ) 
        WHERE MPR = 1
       ) AS "MostTradedProduct",
       '$ ' || ROUND(SUM(export_usd)/1000000000,0) || ' B' AS "TotalExport",
       '$' || ROUND(SUM(import_usd)/1000000000,0) || ' B' AS "TotalImport",
       CASE
       WHEN SUM(export_usd) > SUM(import_usd) THEN 'No'
       ELSE 'Yes'
       END AS "IsTradeDeficit",
       ROUND(AVG(pci),6) AS "Average Product Complexity"
       FROM CountryProductExportDetailsTable O
       WHERE  O.year = '2021'
       GROUP BY "Country Name"
       ORDER BY "Country Name" ASC ;


