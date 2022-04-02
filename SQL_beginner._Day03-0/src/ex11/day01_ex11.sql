-- INSERT INTO menu VALUES (19,2,'greek pizza', 800);

UPDATE menu
SET price = ROUND(price - 0.1 * price)
WHERE pizza_name = 'greek pizza'
