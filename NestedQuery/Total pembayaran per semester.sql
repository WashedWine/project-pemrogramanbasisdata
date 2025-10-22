SELECT p1.semester,
       (SELECT SUM(amount)
        FROM payment p2
        WHERE p2.semester = p1.semester) AS total_amount
FROM payment p1
GROUP BY p1.semester;
