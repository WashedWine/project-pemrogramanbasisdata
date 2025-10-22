SELECT c.name AS course_name,
       ROUND(AVG(g.score), 2) AS avg_course_score,
       (SELECT ROUND(AVG(score), 2) FROM grade WHERE score IS NOT NULL) AS overall_avg
FROM course c
JOIN class cl ON c.course_id = cl.course_id
JOIN enrollment e ON cl.class_id = e.class_id
JOIN grade g ON e.enrollment_id = g.enrollment_id
GROUP BY c.name;
