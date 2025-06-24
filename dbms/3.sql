-- Create table
CREATE TABLE student (
    sno NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    marks NUMBER,
    branch VARCHAR2(20)
);

-- Insert data
INSERT INTO student VALUES (1, 'ram', 70, 'cse');
INSERT INTO student VALUES (2, 'raj', 40, 'eee');
INSERT INTO student VALUES (3, 'kam', 30, 'cse');
INSERT INTO student VALUES (4, 'sara', 90, 'ece');
INSERT INTO student VALUES (5, 'karim', 80, 'cse');

-- Display table data
SELECT * FROM student;

-- COUNT: Total number of students
SELECT COUNT(*) AS total_students FROM student;

-- SUM: Total marks
SELECT SUM(marks) AS total_marks FROM student;

-- AVG: Average marks
SELECT AVG(marks) AS total_avg FROM student;

-- MAX: Highest marks
SELECT MAX(marks) AS max_marks FROM student;

-- MIN: Lowest marks
SELECT MIN(marks) AS min_marks FROM student;


--GroupBy
select branch,count(*) as total_students 
from student
group by branch;

--Having
select branch,avg(marks) as avg_marks from student
group by branch
having avg(marks)>70;


--view
CREATE VIEW high_scores AS
SELECT name, marks
FROM student
WHERE marks > 20;

SELECT * FROM high_scores;

--Drop the VIEW
drop view high_scores;


