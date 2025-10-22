CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    faculty VARCHAR(100)
);

CREATE TABLE lecturer (
    lecturer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT REFERENCES department(department_id)
);

CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    birth_date DATE,
    department_id INT REFERENCES department(department_id)
);

CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    code VARCHAR(20),
    name VARCHAR(100),
    credit INT,
    department_id INT REFERENCES department(department_id)
);

CREATE TABLE class (
    class_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES course(course_id),
    lecturer_id INT REFERENCES lecturer(lecturer_id),
    semester VARCHAR(10),
    year INT
);

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(student_id),
    class_id INT REFERENCES class(class_id),
    enrollment_date DATE
);

CREATE TABLE grade (
    grade_id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollment(enrollment_id),
    score NUMERIC(5,2)
);

CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(student_id),
    semester VARCHAR(10),
    amount NUMERIC(12,2),
    payment_date DATE
);
