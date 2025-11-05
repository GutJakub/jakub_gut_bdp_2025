-- SCHEMA: cwiczenia2

--F
SELECT ST_Area( ST_Difference(b1.geometry, ST_BUFFER(b2.geometry, 0.5)))
FROM buildings b1
JOIN buildings b2 ON b2.name='BuildingB'
WHERE b1.name = 'BuildingC';