-- Department
INSERT INTO department (name, faculty)
VALUES 
('Teknik Informatika', 'Fakultas Ilmu Komputer'),
('Sistem Informasi', 'Fakultas Ilmu Komputer'),
('Teknik Elektro', 'Fakultas Teknik'),
('Teknik Industri', 'Fakultas Teknik'),
('Manajemen', 'Fakultas Ekonomi'),
('Akuntansi', 'Fakultas Ekonomi'),
('Hukum', 'Fakultas Hukum'),
('Psikologi', 'Fakultas Sosial'),
('Desain Komunikasi Visual', 'Fakultas Seni'),
('Arsitektur', 'Fakultas Teknik');

-- Lecturer
INSERT INTO lecturer (first_name, last_name, department_id)
SELECT 'Lecturer_' || i, 'Lastname_' || i, (i % 10) + 1
FROM generate_series(1,10) s(i);

-- Student
INSERT INTO student (first_name, last_name, gender, birth_date, department_id)
SELECT 'Student_' || i, 'Lastname_' || i,
CASE WHEN random() > 0.5 THEN 'M' ELSE 'F' END,
DATE '2001-01-01' + ((i % 365) || ' days')::interval,
(i % 10) + 1
FROM generate_series(1,10) s(i);

-- Course
INSERT INTO course (code, name, credit, department_id)
SELECT 'C' || i, 'Course_' || i, (i % 4) + 2, (i % 10) + 1
FROM generate_series(1,10) s(i);

-- Class
INSERT INTO class (course_id, lecturer_id, semester, year)
SELECT i, i, 'Ganjil', 2025 FROM generate_series(1,10) s(i);

-- Enrollment
INSERT INTO enrollment (student_id, class_id, enrollment_date)
SELECT i, i, DATE '2025-01-01' + ((i % 30) || ' days')::interval
FROM generate_series(1,10) s(i);

-- Grade
INSERT INTO grade (enrollment_id, score)
SELECT i, ROUND((random() * 50 + 50)::numeric, 2)
FROM generate_series(1,10) s(i);

-- Payment
INSERT INTO payment (student_id, semester, amount, payment_date)
SELECT i, 'Ganjil', (random() * 2000000 + 4000000)::numeric(10,2),
DATE '2025-02-01' + ((i % 30) || ' days')::interval
FROM generate_series(1,10) s(i);
