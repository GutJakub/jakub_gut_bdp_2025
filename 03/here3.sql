-- SCHEMA: cwiczenia2

DROP TABLE IF EXISTS streets_reprojected;
CREATE TABLE streets_reprojected AS 
SELECT *, ST_Transform(ST_SetSRID(geom,4326), 3068) AS geom_3068 
FROM ulice19;
ALTER TABLE streets_reprojected DROP COLUMN geom;
ALTER TABLE streets_reprojected RENAME COLUMN geom_3068 TO geom;