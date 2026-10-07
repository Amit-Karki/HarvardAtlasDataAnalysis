
SELECT CER.country_name AS "Country Name",
    CER.rank_hs92 AS CountryRanking ,
    '$ ' || ROUND(HED.total_export_usd/1000000000.0,0) || ' B' AS TotalExport,
    '$ ' || ROUND(HED.total_import_usd/1000000000.0,0) || ' B' AS TotalImport
    FROM CountryEconomicRankingsTable  CER
    INNER JOIN HarvardEconomicData HED
    ON (CER.year = HED.year AND CER.country_id = HED.country_id)
    WHERE (CER.year = '2021')
    ORDER BY rank_hs92 ASC
    LIMIT 5;


