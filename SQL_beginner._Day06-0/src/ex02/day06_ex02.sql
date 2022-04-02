SELECT 	name,
		pizza_name,
		price,
		ROUND(price * (1 - discount / 100)) AS discount_price
FROM person
JOIN person_order
ON person_order.person_id = person.id
JOIN menu
ON menu.id = person_order.menu_id
JOIN person_discounts
ON person_discounts.person_id = person_order.person_id
ORDER BY 1, 2;