-- SCHEMA: cwiczenia2

SELECT b19.*
FROM budynki19 b19
LEFT JOIN budynki b USING (polygon_id)
WHERE b.polygon_id IS NULL
UNION
SELECT b19.*
FROM budynki b
INNER JOIN budynki19 b19 USING (polygon_id)
WHERE b19.height != b.height;