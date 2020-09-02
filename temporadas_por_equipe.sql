SELECT TAB.*, TAB.PONTOS_PADRONIZADOS/TAB.NUMERO_CORRIDAS PONTOS_POR_CORRIDA
FROM
    (SELECT RACES.YEAR, COUNT(RESULTS.CONSTRUCTORID) NUMERO_CORRIDAS,
        SUM(CASE 
            WHEN RESULTS.POSITION = 1 THEN 10
            WHEN RESULTS.POSITION = 2 THEN 6 
            WHEN RESULTS.POSITION = 3 THEN 4 
            WHEN RESULTS.POSITION = 4 THEN 3 
            WHEN RESULTS.POSITION = 5 THEN 2 
            WHEN RESULTS.POSITION = 6 THEN 1
        ELSE 0
        END) AS PONTOS_PADRONIZADOS, CONSTRUCTORS.NAME
        FROM results RESULTS
        INNER JOIN races RACES ON RESULTS.RACEID = RACES.RACEID
        INNER JOIN constructors CONSTRUCTORS ON CONSTRUCTORS.CONSTRUCTORID = RESULTS.CONSTRUCTORID
    GROUP BY CONSTRUCTORS.NAME, RACES.YEAR) TAB
ORDER BY PONTOS_PADRONIZADOS DESC
LIMIT 30;