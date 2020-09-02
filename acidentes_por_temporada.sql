SELECT TOTAL_CORRIDAS.ANO, QUANT_ACIDENTES.QUANTIDADE_DE_ACIDENTES, TOTAL_CORRIDAS.CORRIDAS, 
ROUND(QUANT_ACIDENTES.QUANTIDADE_DE_ACIDENTES / TOTAL_CORRIDAS.CORRIDAS,1) ACIDENTES_POR_CORRIDA
FROM
    (SELECT YEAR ANO, COUNT(RACEID) CORRIDAS
    FROM races RACES
    GROUP BY YEAR) TOTAL_CORRIDAS 
INNER JOIN
    (SELECT RACES.YEAR ANO, COUNT(RESULTS.STATUSID) QUANTIDADE_DE_ACIDENTES
    FROM results RESULTS
    INNER JOIN status STATUS 
    ON STATUS.STATUSID = RESULTS.STATUSID
    INNER JOIN races RACES
    ON RESULTS.RACEID = RACES.RACEID
    WHERE STATUS.STATUSID = 3 OR STATUS.STATUSID = 4
    GROUP BY RACES.YEAR) QUANT_ACIDENTES
ON QUANT_ACIDENTES.ANO = TOTAL_CORRIDAS.ANO
GROUP BY TOTAL_CORRIDAS.ANO; 