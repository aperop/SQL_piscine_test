CREATE OR REPLACE VIEW v_price_with_discount AS
SELECT 	name,
		pizza_name,
		price,
		ROUND(price - 0.1 * price) AS discount_price
FROM person_order
JOIN person
ON person_id = person.id
JOIN menu
ON menu_id = menu.id
ORDER BY name, pizza_name;

-- SELECT * FROM v_price_with_discount;
