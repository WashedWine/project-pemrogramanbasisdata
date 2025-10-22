INSERT INTO department (name, faculty)
SELECT 'Department_' || i,
CASE 
    WHEN i <= 3 THEN 'Fakultas Teknik'
    WHEN i <= 6 THEN 'Fakultas Ekonomi'
    ELSE 'Fakultas Ilmu Komputer'
END
FROM generate_series(1,10) s(i);

INSERT INTO lecturer (first_name, last_name, department_id)
SELECT 'Lecturer_' || i, 'Lastname_' || i, (i % 10) + 1
FROM generate_series(1,100) s(i);

INSERT INTO student (first_name, last_name, gender, birth_date, department_id)
SELECT 'Student_' || i, 'Lastname_' || i,
CASE WHEN random() > 0.5 THEN 'M' ELSE 'F' END,
DATE '2001-01-01' + ((i % 365) || ' days')::interval,
(i % 10) + 1
FROM generate_series(1,100) s(i);

INSERT INTO course (code, name, credit, department_id)
SELECT 'C' || i, 'Course_' || i, (i % 4) + 2, (i % 10) + 1
FROM generate_series(1,100) s(i);

INSERT INTO class (course_id, lecturer_id, semester, year)
SELECT (i % 100) + 1, (i % 100) + 1,
CASE WHEN random() > 0.5 THEN 'Ganjil' ELSE 'Genap' END, 2025
FROM generate_series(1,100) s(i);

INSERT INTO enrollment (student_id, class_id, enrollment_date)
SELECT (i % 100) + 1, (i % 100) + 1,
DATE '2025-01-01' + ((i % 60) || ' days')::interval
FROM generate_series(1,100) s(i);

INSERT INTO grade (enrollment_id, score)
SELECT i, ROUND((random() * 50 + 50)::numeric, 2)
FROM generate_series(1,100) s(i);

INSERT INTO payment (student_id, semester, amount, payment_date)
SELECT (i % 100) + 1,
CASE WHEN random() > 0.5 THEN 'Ganjil' ELSE 'Genap' END,
(random() * 2000000 + 4000000)::numeric(10,2),
DATE '2025-02-01' + ((i % 60) || ' days')::interval
FROM generate_series(1,100) s(i);
