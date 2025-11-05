-- SCHEMA: cwiczenia2

-- DROP SCHEMA IF EXISTS cwiczenia2 ;

CREATE SCHEMA IF NOT EXISTS cwiczenia2
    AUTHORIZATION postgres;

CREATE EXTENSION IF NOT EXISTS postgis;
SET search_path TO cwiczenia2

DROP TABLE IF EXISTS obiekty CASCADE;


CREATE TABLE IF NOT EXISTS obiekty (
	id SERIAL PRIMARY KEY,
	geom geometry,
	NAME TEXT
);


INSERT INTO obiekty (name, geom)
VALUES (
  'obiekt1',
  ST_GeomFromText(
    'COMPOUNDCURVE(
       (0 1, 1 1),
       CIRCULARSTRING(1 1, 2 0, 3 1),
       CIRCULARSTRING(3 1, 4 2, 5 1),
       (5 1, 6 1)
    )',
    0
  )
);

INSERT INTO obiekty (name, geom)
VALUES(
'obiekt2',
ST_SetSRID(
	ST_BuildArea(
		ST_Collect(
			ARRAY[
				ST_GeomFromText('LineString(10 6, 14 6)',0),
				ST_GeomFromText('CircularString(14 6, 16 4, 14 2)',0),
				ST_GeomFromText('CircularString(14 2, 12 0, 10 2)',0),
				ST_GeomFromText('LineString(10 2, 10 6)', 0),
				ST_BOUNDARY(ST_Buffer( ST_Point(12,2),1, 6000))
			]
		)
	),0
)  
);

UPDATE obiekty
SET geom = ST_LineToCurve(geom)
WHERE name='obiekt2';


INSERT INTO obiekty(name,geom)
VALUES(
'obiekt3',ST_GeomFromText('Polygon((7 15, 10 17, 12 13, 7 15))',0)
);
INSERT INTO obiekty(name,geom)
VALUES(
'obiekt4', ST_GeomFromText('LineString(20 20, 25 25, 27 24, 25 22, 26 21, 22 19, 20.5 19.5)',0)
);

INSERT INTO obiekty(name,geom)
VALUES(
'obiekt5', ST_GeomFromText('LineString Z(30 30 59, 38 32 234)',0)
);
INSERT INTO obiekty(name, geom)
VALUES(
'obiekt6', ST_SetSRID(
	ST_Collect(
		'LineString(1 1, 3 2)', 'POINT(4 2)'
		)
	,0)
);

SELECT * FROM obiekty;

--2
WITH 
o3 as (SELECT geom from obiekty where name='obiekt3'),
o4 as (SELECT geom from obiekty where name='obiekt4'),
dist AS (
	SELECT ST_ShortestLine(o3.geom, o4.geom) AS sLine
	FROM o3, o4
)
SELECT ST_Area(ST_Buffer(sLine,5))
from dist;

--3
WITH new AS(
SELECT ST_MakePolygon(ST_AddPoint(geom, ST_StartPoint(geom))) AS new_geom
FROM obiekty
WHERE name='obiekt4'
)
UPDATE obiekty
SET geom = (SELECT new_geom FROM new)
WHERE name='obiekt4'

--4
INSERT INTO obiekty(name, geom)
SELECT 'obiekt7', ST_Collect(geom)
FROM obiekty 
WHERE name='obiekt3' OR name='obiekt4'

--5
SELECT ST_Area(
		ST_Buffer(
				ST_Union(
					ST_Force3D(geom)
				),5
		)
	)
FROM obiekty
WHERE NOT ST_HasArc(geom)

SELECT name, ST_HasArc(geom)
FROM obiekty