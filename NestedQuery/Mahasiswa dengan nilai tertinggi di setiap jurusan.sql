SELECT s.student_id, s.first_name, s.last_name, d.name AS department_name, g.score
FROM student s
JOIN department d ON s.department_id = d.department_id
JOIN enrollment e ON s.student_id = e.student_id
JOIN grade g ON e.enrollment_id = g.enrollment_id
WHERE g.score = (
    SELECT MAX(g2.score)
    FROM grade g2
    JOIN enrollment e2 ON g2.enrollment_id = e2.enrollment_id
    JOIN student s2 ON e2.student_id = s2.student_id
    WHERE s2.department_id = s.department_id
);
