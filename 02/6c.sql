-- SCHEMA: cwiczenia2

--C
SELECT name,
	ST_Area(geometry)
FROM buildings
ORDER BY name ASC;