SELECT d.faculty,
       ROUND(
         (SELECT COUNT(*) FROM student s
          WHERE s.department_id IN (
              SELECT department_id FROM department d2 WHERE d2.faculty = d.faculty
          )
         )::decimal /
         (SELECT COUNT(*) FROM student) * 100, 2
       ) AS percentage
FROM department d
GROUP BY d.faculty;
