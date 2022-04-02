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
WHERE node2 = 'A' AND length(tour) = 7 AND total_cost IN (SELECT min(total_cost)
														  FROM traces
														  WHERE node2 = 'A' AND length(tour) = 7
														  UNION
														  SELECT max(total_cost)
														  FROM traces
														  WHERE node2 = 'A' AND length(tour) = 7)
ORDER BY total_cost, tour
