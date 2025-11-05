-- SCHEMA: cwiczenia2

SELECT un19.*
FROM ulice_node19 un19, input_points ip1, input_points ip2
WHERE ST_DWithin(ST_MakeLine(ip1.geom, ip2.geom), ST_Transform(un19.geom,3068),200) AND
ip1.point_id = 1 AND ip2.point_id = 2 AND un19.intersect='Y';