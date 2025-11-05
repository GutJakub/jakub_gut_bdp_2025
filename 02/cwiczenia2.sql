CREATE SCHEMA IF NOT EXISTS cwiczenia2 AUTHORIZATION postgres;

SET search_path TO cwiczenia2, public;

CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS buildings(
	id SERIAL PRIMARY KEY,
	geometry geometry(POLYGON, 0),
	name TEXT
);

CREATE table IF NOT EXISTS roads(
	id SERIAL PRIMARY KEY,
	geometry geometry(LineString,0),
	name TEXT
);

CREATE TABLE IF NOT EXISTS poi(
	id SERIAL PRIMARY KEY,
	geometry geometry(Point, 0),
	name TEXT
);

INSERT INTO poi(name, geometry)
VALUES ('K',ST_GeomFromText('POINT(6 9.5)',0)),
('G',ST_GeomFromText('POINT (1 3.5)',0)),
('J',ST_GeomFromText('POINT (6.5 6)',0)),
('I',ST_GeomFromText('POINT(9.5 6)',0)),
('H',ST_GeomFromText('POINT (5.5 1.5)',0));

SELECT * FROM poi;

INSERT INTO buildings(name, geometry)
VALUES ('BuildingA',ST_GeomFromText('POLYGON((8 4,10.5 4, 10.5 1.5, 8 1.5, 8 4))',0)),
('BuildingB',ST_GeomFromText('POLYGON((4 5, 6 5, 6 7, 4 7, 4 5))', 0)),
('BuildingC', ST_GeomFromText('POLYGON((3 8, 5 8, 5 6, 3 6, 3 8))',0)),
('BuildingD', ST_GeomFromText('POLYGON((9 9, 10 9, 10 8, 9 8, 9 9))',0)),
('BuildingF', ST_GeomFromText('POLYGON((1 1, 1 2, 2 2, 2 1, 1 1))',0));

SELECT * FROM buildings;

INSERT INTO roads(name, geometry)
VALUES ('RoadX', ST_GeomFromText('LINESTRING(0 4.5, 12 4.5)',0)),
('RoadY', ST_GeomFromText('LINESTRING(7.5 0, 7.5 10.5)',0));

SELECT * FROM roads;


--================ ZADANIE 6 ====================

--A
SELECT SUM(ST_Length(geometry))
FROM roads;

--B
SELECT ST_AsText(geometry), 
	ST_Area(geometry),
	ST_Perimeter(geometry)
FROM buildings
WHERE name='BuildingA';

--C
SELECT name,
	ST_Area(geometry)
FROM buildings
ORDER BY name ASC;

--D
SELECT name, ST_Perimeter(geometry)
FROM buildings
ORDER BY ST_Area(geometry) DESC
LIMIT 2

--E
SELECT ROUND(CAST(ST_Distance(b.geometry, p.geometry) AS numeric),2) AS dist
FROM buildings b
JOIN poi p ON p.name = 'K'
WHERE b.name = 'BuildingC';

--F
SELECT ST_Area( ST_Difference(b1.geometry, ST_BUFFER(b2.geometry, 0.5)))
FROM buildings b1
JOIN buildings b2 ON b2.name='BuildingB'
WHERE b1.name = 'BuildingC';

--G
SELECT b.name
FROM buildings b
JOIN roads r ON r.name = 'RoadX'
WHERE ST_Y(ST_Centroid(b.geometry)) > ST_YMax(r.geometry);

--H
WITH p AS (
  SELECT ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0) AS geometry
)
SELECT ST_Area(ST_Intersection(c.geometry, p.geometry)) AS common_area
FROM buildings c, p
WHERE c.name = 'BuildingC';