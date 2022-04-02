CREATE OR REPLACE VIEW v_symmetric_union AS
WITH R AS (SELECT *
		   FROM person_visits
		   WHERE visit_date = '2022-01-02'),
	 S AS (SELECT *
		   FROM person_visits
		   WHERE visit_date = '2022-01-06'),
	R_S AS (SELECT *
			FROM R
			EXCEPT ALL
			SELECT *
			FROM S),
	S_R AS (SELECT *
			FROM S
			EXCEPT ALL
			SELECT *
			FROM R)
(SELECT * FROM R_S
UNION ALL
SELECT * FROM S_R
ORDER BY person_id);

-- SELECT * FROM v_symmetric_union
