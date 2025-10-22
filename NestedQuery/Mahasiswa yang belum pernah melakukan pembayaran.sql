SELECT s.student_id, s.first_name, s.last_name
FROM student s
WHERE s.student_id NOT IN (
    SELECT DISTINCT p.student_id
    FROM payment p
);
