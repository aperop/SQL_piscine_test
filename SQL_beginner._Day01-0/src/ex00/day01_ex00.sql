SELECT  t1.object_id, t1.object_name
FROM
	(SELECT id AS object_id,
		    name AS object_name,
		    LOWER(name) AS sort
	FROM person
	UNION ALL
	SELECT id,
		   pizza_name,
		   LOWER(pizza_name)
	FROM menu)
AS t1
ORDER BY t1.sort
