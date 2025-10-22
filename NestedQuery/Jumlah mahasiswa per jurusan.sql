SELECT d.name AS department_name,
       (SELECT COUNT(*) FROM student s WHERE s.department_id = d.department_id) AS total_students
FROM department d;
