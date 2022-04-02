with t1 AS (SELECT 	name,
			COUNT(pizzeria_id) AS count,
			'visit' AS action_type
			FROM person_visits
			JOIN pizzeria
			ON pizzeria.id = pizzeria_id
			GROUP BY name
		   ),
	 t2 AS (SELECT 	name,
			COUNT(pizzeria_id) AS count,
			'order' AS action_type
			FROM person_order
			JOIN menu
			ON menu.id = menu_id
			JOIN pizzeria
			ON pizzeria.id = pizzeria_id
			GROUP BY name
		   ),
	t3 AS (SELECT t1.name, (t1.count + t2.count) AS total_count
		   FROM t1
		   JOIN t2
		   ON t1.name = t2.name
		  )
SELECT 	pizzeria.name,
		CASE
			WHEN total_count IS NULL
				THEN 0
			ELSE total_count
		END
FROM pizzeria
FULL JOIN t3
ON pizzeria.name = t3.name
ORDER BY total_count DESC;