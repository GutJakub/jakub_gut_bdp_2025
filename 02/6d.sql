-- SCHEMA: cwiczenia2

--D
SELECT name, ST_Perimeter(geometry)
FROM buildings
ORDER BY ST_Area(geometry) DESC
LIMIT 2