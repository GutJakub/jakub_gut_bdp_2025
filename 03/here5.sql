-- SCHEMA: cwiczenia2

UPDATE input_points
SET geom = ST_Transform(ST_SetSRID(geom, 4326), 3068);