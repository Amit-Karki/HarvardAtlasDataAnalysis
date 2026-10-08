WITH Ranked AS (
    SELECT
        country_name,
        product_name,
        year,
        ROUND((SUM(export_usd) - SUM(import_usd)) / 1000000000.0, 3) AS TotalTradeSurplus,
        ROW_NUMBER() OVER (
            PARTITION BY country_name
            ORDER BY SUM(export_usd) - SUM(import_usd) DESC
        ) AS tt
    FROM countryproductexportdetailstable
    WHERE year = '2020'
    GROUP BY country_name, product_name,year
)
SELECT
    country_name,
    product_name AS HighestSurplusProduct,
    '$ ' || ROUND(TotalTradeSurplus,0) || ' B'
FROM Ranked
WHERE tt = 1
ORDER BY TotalTradeSurplus DESC
LIMIT 10;