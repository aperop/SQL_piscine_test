INSERT INTO menu
VALUES ((SELECT MAX(id) + 1 FROM menu),
		(SELECT id FROM pizzeria WHERE name = 'Dominos'),
		'sicilian pizza',
		900);

-- SELECT *
-- FROM menu

-- DELETE FROM menu
-- WHERE id > 18 
