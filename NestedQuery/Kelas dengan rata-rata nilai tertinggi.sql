SELECT c.class_id,
       (SELECT ROUND(AVG(g.score), 2)
        FROM grade g
        JOIN enrollment e ON g.enrollment_id = e.enrollment_id
        WHERE e.class_id = c.class_id) AS avg_class_score
FROM class c
ORDER BY avg_class_score DESC
LIMIT 5;
