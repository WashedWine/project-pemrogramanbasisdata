SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name
FROM student s
WHERE s.student_id IN (
    SELECT e.student_id
    FROM enrollment e
    JOIN grade g ON e.enrollment_id = g.enrollment_id
    GROUP BY e.student_id
    HAVING MIN(g.score) >= 85
);
