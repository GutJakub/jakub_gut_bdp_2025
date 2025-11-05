-- SCHEMA: cwiczenia2

--E
SELECT ROUND(CAST(ST_Distance(b.geometry, p.geometry) AS numeric),2) AS dist
FROM buildings b
JOIN poi p ON p.name = 'K'
WHERE b.name = 'BuildingC';