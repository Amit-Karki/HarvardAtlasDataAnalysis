
CREATE TABLE CountryProductExportDetailsTable(
    country_id VARCHAR(10),
    iso3_code CHAR(3),
    product_id VARCHAR(10),
    hs92_code VARCHAR(10),
    year SMALLINT,
    export_usd DECIMAL(20,2),
    import_usd DECIMAl(20,2),
    World_export_share NUMERIC(8,4),
    rca NUMERIC(8,4),
    product_distance NUMERIC(20,10),
    complexity_outlook_gain NUMERIC(8,4),
    pci NUMERIC(8,4),
    PRIMARY KEY(country_id,year,product_id)
);

CREATE TABLE CountryEconomicRankingsTable(
    country_id VARCHAR(10),
    iso3_code CHAR(3),
    year SMALLINT,
    projected_growth NUMERIC(20,10),
    is_ranked BOOLEAN,
    eci_sitc NUMERIC(20,10),
    rank_sitc NUMERIC(6,0),
    eci_hs92 NUMERIC(20,10),
    rank_hs92 NUMERIC(20,10),
    PRIMARY KEY(country_id,year)
);
CREATE TABLE HarvardEconomicData(
    country_id VARCHAR(10),
    iso3_code CHAR(3),
    year SMALLINT,
    total_export_usd BIGINT,
    total_import_usd BIGINT,
    eci NUMERIC(20,10),
    coi NUMERIC(20,10),
    export_product_count SMALLINT,
    projected_growth NUMERIC(20,10),
    PRIMARY KEY(country_id,year)
);

