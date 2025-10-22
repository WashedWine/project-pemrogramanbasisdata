SELECT s.student_id, s.first_name, s.last_name,
       (SELECT SUM(g.score)
        FROM grade g
        JOIN enrollment e ON g.enrollment_id = e.enrollment_id
        WHERE e.student_id = s.student_id) AS total_score
FROM student s
ORDER BY total_score DESC
LIMIT 5;
