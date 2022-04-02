SELECT t1.name AS person_name,
	   pizza_name,
	   t4.name AS pizzeria_name
FROM person AS t1
JOIN person_order AS t2
	 ON t1.id = t2.person_id
JOIN menu AS t3
	 ON t2.menu_id = t3.id
JOIN pizzeria AS t4
	 ON t3.pizzeria_id = t4.id
ORDER BY person_name, pizza_name, pizzeria_name;