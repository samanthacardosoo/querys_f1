SELECT nationality ORIGEM, COUNT(driverID) TOTAL_PILOTOS,  
CASE WHEN nationality = 'American' THEN 'NORTH AMERICA'
WHEN nationality = 'American-Italian' THEN 'NORTH AMERICA'
WHEN nationality = 'Argentine' THEN 'SOUTH AMERICA'
WHEN nationality = 'Argentine-Italian' THEN 'SOUTH AMERICA'
WHEN nationality = 'Australian' THEN 'OCEANIA'
WHEN nationality = 'Austrian' THEN 'EUROPE'
WHEN nationality = 'Belgian' THEN 'EUROPE'
WHEN nationality = 'Brazilian' THEN 'SOUTH AMERICA'
WHEN nationality = 'British' THEN 'EUROPE'
WHEN nationality = 'Canadian' THEN 'NORTH AMERICA'
WHEN nationality = 'Chilean' THEN 'SOUTH AMERICA'
WHEN nationality = 'Colombian' THEN 'SOUTH AMERICA' 
WHEN nationality = 'Czech' THEN 'EUROPE'
WHEN nationality = 'Danish' THEN 'EUROPE'
WHEN nationality = 'Dutch' THEN 'EUROPE'
WHEN nationality = 'East German' THEN 'EUROPE'
WHEN nationality = 'Finnish' THEN 'EUROPE'
WHEN nationality = 'French' THEN 'EUROPE'
WHEN nationality = 'German' THEN 'EUROPE'
WHEN nationality = 'Hungarian' THEN 'EUROPE'
WHEN nationality = 'Indian' THEN 'ASIA'
WHEN nationality = 'Indonesian' THEN 'ASIA'
WHEN nationality = 'Irish' THEN 'EUROPE'
WHEN nationality = 'Italian' THEN 'EUROPE'
WHEN nationality = 'Japanese' THEN 'ASIA'
WHEN nationality = 'Liechtensteiner' THEN 'EUROPE'
WHEN nationality = 'Malaysian' THEN 'ASIA'
WHEN nationality = 'Mexican' THEN 'NORTH AMERICA'
WHEN nationality = 'Monegasque' THEN 'EUROPE'
WHEN nationality = 'New Zealander' THEN 'OCEANIA'
WHEN nationality = 'Polish' THEN 'EUROPE'
WHEN nationality = 'Portuguese' THEN 'EUROPE'
WHEN nationality = 'Rhodesian' THEN 'AFRICA'
WHEN nationality = 'Russian' THEN 'ASIA'
WHEN nationality = 'South African' THEN 'AFRICA'
WHEN nationality = 'Spanish' THEN 'EUROPE'
WHEN nationality = 'Swedish' THEN 'EUROPE'
WHEN nationality = 'Swiss' THEN 'EUROPE'
WHEN nationality = 'Thai' THEN 'ASIA'
WHEN nationality = 'Uruguayan' THEN 'SOUTH AMERICA'
WHEN nationality = 'Venezuelan' THEN 'SOUTH AMERICA'
END AS CONTINENTE FROM drivers
GROUP BY nationality order by COUNT(driverID) desc;