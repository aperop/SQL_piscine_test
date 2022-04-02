WITH Andrey_visit AS (SELECT pizzeria.name
					  FROM pizzeria
					  JOIN person_visits AS visit
					  ON pizzeria.id = visit.pizzeria_id
					  JOIN (SELECT id
							FROM person
							WHERE name = 'Andrey') AS person
					  ON person.id = visit.person_id
					 ),
	Andrey_order AS (SELECT pizzeria.name
					 FROM pizzeria
					 JOIN menu ON pizzeria.id = menu.pizzeria_id
					 JOIN person_order AS porder
					 ON menu.id = porder.menu_id
					 JOIN (SELECT id
						   FROM person
						   WHERE name = 'Andrey') AS person
					 ON person.id = porder.person_id
					)

SELECT name AS pizzeria_name
FROM Andrey_visit
EXCEPT
SELECT name
FROM Andrey_order
