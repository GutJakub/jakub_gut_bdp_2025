-- SCHEMA: cwiczenia2

SELECT COUNT(DISTINCT p19.poi_id)
FROM punkty19 p19, land_usea19 luA
WHERE ST_DWithin(p19.geom, luA.geom,300) AND p19.type = 'Sporting Goods Store' 
AND luA.type = 'Park (City/County)';