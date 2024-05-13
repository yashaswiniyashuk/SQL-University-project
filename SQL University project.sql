CREATE DATABASE UNIVERSITY
USE UNIVERSITY
CREATE TABLE UNIVERSITY.STUDENTS(STUDENT_ID INT PRIMARY KEY, STUDENT_NAME VARCHAR(30), DATE_OF_BIRTH DATE, EMAIL VARCHAR(50), MAJOR VARCHAR(50))
CREATE TABLE UNIVERSITY.COURSES(COURSE_ID INT PRIMARY KEY, COURSE_NAME VARCHAR(30), CREDIT_HOURS INT, INSTRUCTOR VARCHAR(50))
DESC UNIVERSITY.STUDENTS
INSERT INTO UNIVERSITY.STUDENTS (STUDENT_ID, STUDENT_NAME, DATE_OF_BIRTH, EMAIL, MAJOR) 
VALUES
    (1, 'John Doe', '2000-05-15', 'john.doe@example.com', 'Computer Science'),
    (2, 'Jane Smith', '1999-09-20', 'jane.smith@example.com', 'Biology'),
    (3, 'Alice Johnson', '2001-03-10', 'alice.johnson@example.com', 'Mathematics');
SELECT * FROM UNIVERSITY.STUDENTS
INSERT INTO UNIVERSITY.COURSES (COURSE_ID, COURSE_NAME, CREDIT_HOURS, INSTRUCTOR) 
VALUES
    (101, 'Computer Science', 3, 'Dr. Smith'),
    (102, 'Biology 101', 4, 'Prof. Johnson'),
    (103, 'Calculus I', 4, 'Dr. Anderson');
    SELECT * FROM UNIVERSITY.COURSES
    
   --  Retrieve the list of all students.-- 
SELECT * FROM UNIVERSITY.STUDENTS WHERE MAJOR = 'COMPUTER SCIENCE'

-- Retrieve the list of students who were born before a specific date.-- 
SELECT * FROM UNIVERSITY.STUDENTS WHERE DATE_OF_BIRTH < '2001-03-01'

-- Retrieve the list of courses taught by a specific instructor.--  
SELECT * FROM UNIVERSITY.COURSES WHERE INSTRUCTOR = 'Dr. Anderson'

-- Retrieve the total number of students enrolled in each major. 
SELECT MAJOR, COUNT(*) AS TOTAL_STUDENTS
FROM UNIVERSITY.STUDENTS
GROUP BY MAJOR;

-- Retrieve the course with the highest number of credit hours.
SELECT *
FROM UNIVERSITY.COURSES
ORDER BY CREDIT_HOURS DESC LIMIT 1

-- Retrieve the oldest and youngest students in the database. 
SELECT *
FROM UNIVERSITY.STUDENTS
WHERE DATE_OF_BIRTH IN (
    SELECT MIN(DATE_OF_BIRTH) FROM UNIVERSITY.STUDENTS
    UNION ALL
    SELECT MAX(DATE_OF_BIRTH) FROM UNIVERSITY.STUDENTS
)

-- Add a new course to the Courses table. 
INSERT INTO UNIVERSITY.COURSES (COURSE_ID, COURSE_NAME, CREDIT_HOURS, INSTRUCTOR)
VALUES 
    (4, 'Physics', 3, 'Dr. Thompson'),
    (5, 'Chemistry', 4, 'Dr. Davis');
SELECT * FROM UNIVERSITY.COURSES
UPDATE UNIVERSITY.COURSES SET COURSE_ID = '104' WHERE COURSE_NAME = 'Physics'
UPDATE UNIVERSITY.COURSES SET COURSE_ID = '105' WHERE COURSE_NAME = 'Chemistry'

-- Enroll a new student in the Students table.
INSERT INTO UNIVERSITY.STUDENTS (STUDENT_ID, STUDENT_NAME, DATE_OF_BIRTH, EMAIL, MAJOR) 
VALUES
(4, 'Bob Brown', '2002-07-25', 'bob.brown@example.com', 'Physics'),
(5, 'Emily Davis', '2003-04-18', 'emily.davis@example.com', 'Chemistry')
SELECT * FROM UNIVERSITY.STUDENTS

-- Update the email address of a student based on their student_id. 
UPDATE UNIVERSITY.STUDENTS SET EMAIL = 'new_email@example.com' WHERE STUDENT_ID = 4;

CREATE TABLE UNIVERSITY.RESULTS(STUDENT_ID INT, COURSE_ID VARCHAR(50), MAJOR VARCHAR(50))
DESC UNIVERSITY.RESULTS

INSERT INTO UNIVERSITY.RESULTS (STUDENT_ID, COURSE_ID, MAJOR)
VALUES 
    (4, 104, 'Chemistry'),
    (5, 105, 'Computer Science');
    SELECT * FROM UNIVERSITY.RESULTS

-- Retrieve the list of students who are enrolled in a specific course. 
SELECT students.STUDENT_NAME, courses.COURSE_NAME AS `SPECIFIC COURSE`
FROM students
JOIN results ON students.STUDENT_ID = results.STUDENT_ID
JOIN courses ON results.COURSE_ID = courses.COURSE_ID
WHERE courses.COURSE_NAME = 'Chemistry'
ORDER BY `SPECIFIC COURSE`, students.STUDENT_NAME;


