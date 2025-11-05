-- SCHEMA: cwiczenia2

--B
SELECT ST_AsText(geometry), 
	ST_Area(geometry),
	ST_Perimeter(geometry)
FROM buildings
WHERE name='BuildingA';