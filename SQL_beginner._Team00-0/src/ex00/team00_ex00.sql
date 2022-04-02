CREATE TABLE IF NOT EXISTS  graph (
	node1 varchar not null,
	node2 varchar not null,
  	cost integer not null,
	UNIQUE (node1, node2, cost)
);

INSERT INTO graph (node1, node2, cost)
VALUES
		('A','B',10),
		('A','C',15),
		('A','D',20),
		('B','A',10),
		('B','C',35),
		('B','D',25),
		('C','A',15),
		('C','B',35),
		('C','D',30),
		('D','A',20),
		('D','B',25),
		('D','C',30)
		ON CONFLICT DO NOTHING;

WITH RECURSIVE traces AS (
				SELECT 	node1 AS tour,
						node1,
						node2,
						cost,
						cost AS total_cost
				FROM graph
				WHERE node1 = 'A'
				UNION ALL
				SELECT 	CONCAT(parrent.tour, ',', child.node1) AS trace,
						child.node1,
						child.node2,
						child.cost,
						parrent.total_cost + child.cost AS total_cost
				FROM graph AS child
				INNER JOIN traces AS parrent
				ON child.node1 = parrent.node2
				WHERE tour NOT LIKE ('%' || child.node1 || '%')
)
SELECT 	total_cost,
	  	('{' || tour || ',A}') AS tour
FROM traces
WHERE node2 = 'A' AND LENGTH(tour) = 7 AND total_cost IN (SELECT MIN(total_cost)
														  FROM traces
														  WHERE node2 = 'A' AND LENGTH(tour) = 7)
ORDER BY total_cost, tour
