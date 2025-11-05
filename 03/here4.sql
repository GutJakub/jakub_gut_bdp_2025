-- SCHEMA: cwiczenia2

DROP TABLE IF EXISTS input_points;
CREATE TABLE input_points(
	point_id SERIAL PRIMARY KEY,
	geom GEOMETRY(Point, 0)
)

INSERT INTO input_points(geom)
VALUES( ST_GeomFromText('Point(8.36093 49.03174)', 0)),
	(ST_GeomFromText('Point(8.39876 49.00644)',0))

