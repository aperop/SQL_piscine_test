SELECT (SELECT name
		FROM person
		WHERE person.id = person_id) AS person_name,
       (SELECT name
		FROM pizzeria
		WHERE pizzeria.id = pizzeria_id) AS pizzeria_name
FROM (SELECT visit_date, person_id, pizzeria_id
	  FROM person_visits
	  WHERE person_id = person_visits.person_id AND
	  		pizzeria_id = person_visits.pizzeria_id AND
	  		visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS t1
ORDER BY person_name ASC, pizzeria_name DESC