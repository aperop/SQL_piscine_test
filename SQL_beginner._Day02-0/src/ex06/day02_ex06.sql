WITH t1 AS (SELECT 	menu.pizza_name AS pizza_name,
           			pizzeria.name AS pizzeria_name,
			  		person.name AS person_name
        	FROM menu
			JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
			JOIN person_order ON person_order.menu_id = menu.id
			JOIN person ON person.id = person_order.person_id
		   )
SELECT t1.pizza_name, t1.pizzeria_name
FROM t1 WHERE t1.person_name = 'Anna'
AND t1.pizza_name IN (SELECT t1.pizza_name AS pn FROM t1 WHERE t1.person_name = 'Denis')
UNION
SELECT t1.pizza_name, t1.pizzeria_name
FROM t1 WHERE t1.person_name = 'Denis'
AND t1.pizza_name IN (SELECT t1.pizza_name AS pn FROM t1 WHERE t1.person_name = 'Anna')
ORDER BY 1, 2;
