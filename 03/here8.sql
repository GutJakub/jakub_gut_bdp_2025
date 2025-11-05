-- SCHEMA: cwiczenia2

CREATE TABLE T2019_KAR_BRIDGES AS 
SELECT ST_CollectionExtract(ST_Intersection(w19.geom, t19.geom), 1)
FROM water19 w19, tory19 t19
WHERE ST_Intersects(w19.geom, t19.geom);