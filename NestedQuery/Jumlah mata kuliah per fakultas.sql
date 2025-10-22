SELECT d.faculty,
       (SELECT COUNT(*)
        FROM course c
        JOIN department d2 ON c.department_id = d2.department_id
        WHERE d2.faculty = d.faculty) AS total_courses
FROM department d
GROUP BY d.faculty;
