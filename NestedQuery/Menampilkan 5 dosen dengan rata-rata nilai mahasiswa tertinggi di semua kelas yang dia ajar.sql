  SELECT 
    l.lecturer_id,
    l.first_name,
    l.last_name,
    ROUND(AVG(g.score), 2) AS avg_score
FROM lecturer l
JOIN class cl ON l.lecturer_id = cl.lecturer_id
JOIN enrollment e ON cl.class_id = e.class_id
JOIN grade g ON e.enrollment_id = g.enrollment_id
WHERE g.score IS NOT NULL
GROUP BY l.lecturer_id, l.first_name, l.last_name
HAVING AVG(g.score) > (
    SELECT AVG(g2.score)
    FROM grade g2
)
ORDER BY avg_score DESC
LIMIT 5;
