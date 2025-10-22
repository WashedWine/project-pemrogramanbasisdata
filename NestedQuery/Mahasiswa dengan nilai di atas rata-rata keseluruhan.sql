SELECT l.lecturer_id, l.first_name, l.last_name
FROM lecturer l
WHERE l.lecturer_id = (
    SELECT cl.lecturer_id
    FROM class cl
    JOIN enrollment e ON cl.class_id = e.class_id
    JOIN grade g ON e.enrollment_id = g.enrollment_id
    GROUP BY cl.lecturer_id
    ORDER BY AVG(g.score) DESC
    LIMIT 1
);
