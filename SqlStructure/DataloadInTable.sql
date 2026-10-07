COPY CountryEconomicRankingsTable
FROM 'A:/Downloads/HelmetData/HarvardAtlasDataAnalysis/Data/CountryEconomicRanking.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY CountryProductExportDetailsTable
FROM 'A:/Downloads/HelmetData/HarvardAtlasDataAnalysis/Data/CountryProductExportDetails.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY HarvardEconomicData
FROM 'A:/Downloads/HelmetData/HarvardAtlasDataAnalysis/Data/HarvardEconomicData.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
