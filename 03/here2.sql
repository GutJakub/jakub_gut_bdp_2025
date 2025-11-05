-- SCHEMA: cwiczenia2

WITH new_builds AS(
SELECT b19.*
FROM budynki19 b19
LEFT JOIN budynki b USING (polygon_id)
WHERE b.polygon_id IS NULL
UNION 
SELECT b19.*
FROM budynki b
INNER JOIN budynki19 b19 USING (polygon_id)
WHERE b19.height != b.height
),

new_points AS(
SELECT p19.*
FROM punkty19 p19
LEFT JOIN punkty p USING (poi_id)
WHERE p.poi_id IS NULL
)

SELECT np.type, COUNT(DISTINCT np.poi_id)
FROM new_points nb
INNER JOIN new_points np ON ST_DWithin(np.geom,nb.geom, 500)
GROUP BY np.type