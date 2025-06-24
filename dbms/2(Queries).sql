-- Create student table
CREATE TABLE student (
    sno NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    marks NUMBER
);

-- Create department table
CREATE TABLE department (
    id NUMBER PRIMARY KEY,
    dname VARCHAR2(50)
);

-- Insert data into student
INSERT INTO student VALUES (1, 'ravi', 75);
INSERT INTO student VALUES (2, 'srir', 30);
INSERT INTO student VALUES (3, 'kar', 70);

-- Insert data into department
INSERT INTO department VALUES (1, 'cse');
INSERT INTO department VALUES (2, 'eee');

-----------------------------------------------------
-- IN operator: names of students with sno in (1, 2)
SELECT name FROM student WHERE sno IN (1, 2);
-- Output:
-- | NAME  |
-- |-------|
-- | ravi  |
-- | srir  |

-----------------------------------------------------
-- ANY operator: students with marks greater than any student with sno < 3
SELECT * FROM student
WHERE marks > ANY (SELECT marks FROM student WHERE sno < 3);
-- Inner subquery: SELECT marks FROM student WHERE sno < 3;
-- Result: 75, 30
-- So: marks > ANY(75, 30) = marks > 30
-- Output:
-- | SNO | NAME  | MARKS |
-- |-----|-------|-------|
-- | 1   | ravi  | 75    |
-- | 3   | kar   | 70    |

-----------------------------------------------------
-- ALL operator: students whose marks >= ALL of students with sno > 3
SELECT * FROM student
WHERE marks >= ALL (SELECT marks FROM student WHERE sno > 3);
-- Subquery returns 0 rows → ALL is TRUE for all rows
-- Output:
-- | SNO | NAME  | MARKS |
-- |-----|-------|-------|
-- | 1   | ravi  | 75    |
-- | 2   | srir  | 30    |
-- | 3   | kar   | 70    |

-----------------------------------------------------
-- EXISTS operator: check if student.sno matches any department.id
SELECT * FROM student s
WHERE EXISTS (
    SELECT * FROM department d
    WHERE d.id = s.sno
);
-- department ids: 1, 2
-- Matching student sno: 1, 2
-- Output:
-- | SNO | NAME  | MARKS |
-- |-----|-------|-------|
-- | 1   | ravi  | 75    |
-- | 2   | srir  | 30    |

-----------------------------------------------------
-- NOT EXISTS operator: students whose sno does not match any department.id
SELECT * FROM student s
WHERE NOT EXISTS (
    SELECT * FROM department d
    WHERE d.id = s.sno
);
-- student sno not in department.id = 3
-- Output:
-- | SNO | NAME | MARKS |
-- |-----|------|--------|
-- | 3   | kar  | 70     |

-----------------------------------------------------
-- UNION: combine names from student and department (removes duplicates)
SELECT name FROM student
UNION
SELECT dname FROM department;
-- student names: ravi, srir, kar
-- department names: cse, eee
-- Output:
-- | NAME  |
-- |-------|
-- | ravi  |
-- | srir  |
-- | kar   |
-- | cse   |
-- | eee   |

-----------------------------------------------------
-- INTERSECT: common values between student.name and department.dname
SELECT name FROM student
INTERSECT
SELECT dname FROM department;
-- No name in student matches department.dname exactly
-- Output: (no rows)
