SELECT d.name AS department_name,
       (SELECT ROUND(AVG(g.score), 2)
        FROM grade g
        JOIN enrollment e ON g.enrollment_id = e.enrollment_id
        JOIN student s ON e.student_id = s.student_id
        WHERE s.department_id = d.department_id) AS avg_score
FROM department d;
