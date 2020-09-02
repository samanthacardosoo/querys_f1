SELECT DADOS.ANO, DADOS.MELHOR_TEMPO, DADOS.MELHOR_VOLTA, DADOS.PILOTOS, DADOS.EQUIPE, DADOS.CIRCUITO
FROM
    (SELECT races.year ANO, results.fastestLapTime MELHOR_TEMPO, results.fastestLap MELHOR_VOLTA, CONCAT(drivers.forename, " ", drivers.surname) PILOTOS, constructors.name EQUIPE, races.name CIRCUITO
    FROM results
    INNER JOIN drivers ON drivers.driverId = results.driverId
    INNER JOIN constructors ON constructors.constructorId = results.constructorId
    INNER JOIN races ON races.raceId = results.raceId) DADOS
INNER JOIN 
    (SELECT MIN(results.fastestLapTime) MELHOR_HITORIA, races.NAME CIRCUITO
    FROM results
    INNER JOIN races ON races.raceId = results.raceId
    WHERE results.fastestLapTime <> ""
    GROUP BY races.NAME) MINIMO
ON MINIMO.MELHOR_HITORIA = DADOS.MELHOR_TEMPO AND MINIMO.CIRCUITO = DADOS.CIRCUITO
ORDER BY DADOS.MELHOR_TEMPO;