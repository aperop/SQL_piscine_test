WITH pizza1 AS (SELECT pizzeria.name, pizza_name, price, pizzeria.id
			    FROM menu
			    JOIN pizzeria
			    ON menu.pizzeria_id = pizzeria.id
			   ),
	 pizza2 AS (SELECT *
				FROM pizza1
			   )
SELECT DISTINCT pizza1.pizza_name,
				pizza1.name AS pizzeria_name_1,
				pizza2.name AS pizzeria_name_2,
				pizza1.price
FROM pizza2, menu
JOIN pizza1 ON menu.pizzeria_id = pizza1.id
WHERE pizza1.pizza_name = pizza2.pizza_name AND
	  pizza1.price = pizza2.price AND
	  pizza1.name < pizza2.name
ORDER BY 1;
