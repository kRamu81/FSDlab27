-- Create tables
CREATE TABLE student (
    sno NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    marks NUMBER
);

CREATE TABLE department (
    id NUMBER PRIMARY KEY,
    dname VARCHAR2(50)
);

-- Insert data
INSERT INTO student VALUES (1, 'ravi', 75);
INSERT INTO student VALUES (2, 'srir', 30);
INSERT INTO student VALUES (3, 'kar', 70);

INSERT INTO department VALUES (1, 'cse');
INSERT INTO department VALUES (2, 'eee');

-- IN operator
SELECT name FROM student WHERE sno IN (1, 2);

-- ANY operator
SELECT * FROM student
WHERE marks > ANY (SELECT marks FROM student WHERE sno < 3);

-- ALL operator
SELECT * FROM student
WHERE marks >= ALL (SELECT marks FROM student WHERE sno > 3);

-- EXISTS operator
SELECT * FROM student s
WHERE EXISTS (
    SELECT * FROM department d
    WHERE d.id = s.sno
);

--Not exists 

select * from student s
where not exists(
select * from department d
where d.id=s.sno
);

--union
SELECT name FROM student
UNION
SELECT dname FROM department;

--interset
select name from student
intersect
select dname from department;
