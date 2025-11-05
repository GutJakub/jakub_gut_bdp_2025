-- SCHEMA: cwiczenia2

--H
WITH p AS (
  SELECT ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0) AS geometry
)
SELECT ST_Area(ST_Intersection(c.geometry, p.geometry)) AS common_area
FROM buildings c, p
WHERE c.name = 'BuildingC';