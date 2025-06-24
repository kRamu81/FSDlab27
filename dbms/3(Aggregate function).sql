-- Step 1: Create the 'student' table
CREATE TABLE student (
    sno NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    marks NUMBER,
    branch VARCHAR2(20)
);

-- Step 2: Insert sample student records into the 'student' table
INSERT INTO student VALUES (1, 'ram', 70, 'cse');
INSERT INTO student VALUES (2, 'raj', 40, 'eee');
INSERT INTO student VALUES (3, 'kam', 30, 'cse');
INSERT INTO student VALUES (4, 'sara', 90, 'ece');
INSERT INTO student VALUES (5, 'karim', 80, 'cse');

-- Step 3: Display all records from the student table
SELECT * FROM student;
-- Output:
-- | SNO | NAME  | MARKS | BRANCH |
-- |-----|-------|-------|--------|
-- |  1  | ram   |  70   | cse    |
-- |  2  | raj   |  40   | eee    |
-- |  3  | kam   |  30   | cse    |
-- |  4  | sara  |  90   | ece    |
-- |  5  | karim |  80   | cse    |

-- Step 4: Count total number of students
SELECT COUNT(*) AS total_students FROM student;
-- Output:
-- | TOTAL_STUDENTS |
-- |----------------|
-- |       5        |

-- Step 5: Calculate the total sum of all students' marks
SELECT SUM(marks) AS total_marks FROM student;
-- Output:
-- | TOTAL_MARKS |
-- |-------------|
-- |     310     |

-- Step 6: Calculate the average marks of all students
SELECT AVG(marks) AS total_avg FROM student;
-- Output:
-- | TOTAL_AVG |
-- |-----------|
-- |    62     |

-- Step 7: Find the highest mark among students
SELECT MAX(marks) AS max_marks FROM student;
-- Output:
-- | MAX_MARKS |
-- |-----------|
-- |    90     |

-- Step 8: Find the lowest mark among students
SELECT MIN(marks) AS min_marks FROM student;
-- Output:
-- | MIN_MARKS |
-- |-----------|
-- |    30     |

-- Step 9: Count number of students per branch using GROUP BY
SELECT branch, COUNT(*) AS total_students 
FROM student
GROUP BY branch;
-- Output:
-- | BRANCH | TOTAL_STUDENTS |
-- |--------|----------------|
-- | cse    |        3       |
-- | eee    |        1       |
-- | ece    |        1       |

-- Step 10: Show average marks per branch only if average > 70 using HAVING
SELECT branch, AVG(marks) AS avg_marks 
FROM student
GROUP BY branch
HAVING AVG(marks) > 70;
-- Output:
-- | BRANCH | AVG_MARKS |
-- |--------|-----------|
-- | ece    |    90     |
-- | cse    |    60     | -- Not shown because 60 ≤ 70

-- Step 11: Create a VIEW called 'high_scores' to show students with marks > 20
CREATE VIEW high_scores AS
SELECT name, marks
FROM student
WHERE marks > 20;

-- Step 12: Display data from the created VIEW
SELECT * FROM high_scores;
-- Output:
-- | NAME  | MARKS |
-- |-------|--------|
-- | ram   |   70   |
-- | raj   |   40   |
-- | kam   |   30   |
-- | sara  |   90   |
-- | karim |   80   |

-- Step 13: Drop the VIEW 'high_scores'
DROP VIEW high_scores;
-- Output: View dropped successfully (no rows returned)
