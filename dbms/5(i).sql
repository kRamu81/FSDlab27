-- Create the table
CREATE TABLE student (
    sno NUMBER(10),
    name VARCHAR2(50),
    ranks VARCHAR2(10)
);

-- Insert sample data
INSERT INTO student VALUES (501, 'ramu', 'third');
INSERT INTO student VALUES (502, 'raju', 'second');
INSERT INTO student VALUES (503, 'ravi', '');

-- Display current data
SELECT * FROM student;

-- Output:
-- | SNO | NAME | RANKS  |
-- |-----|------|--------|
-- | 501 | ramu | third  |
-- | 502 | raju | second |
-- | 503 | ravi |        |

-- Enable DBMS output
SET SERVEROUTPUT ON;

-- PL/SQL block to find student with first rank
DECLARE 
  temp1 NUMBER(10);
  temp2 VARCHAR2(10);
BEGIN
  SELECT sno, name INTO temp1, temp2 FROM student
  WHERE ranks = 'first';
  
  DBMS_OUTPUT.PUT_LINE('Student No: ' || temp1 || ' Name: ' || temp2 || ' got first rank');

EXCEPTION
  WHEN NO_DATA_FOUND THEN 
    DBMS_OUTPUT.PUT_LINE('**********************************');
    DBMS_OUTPUT.PUT_LINE('#Error: There is no student who got first rank');
END;
/

-- Output (before update):
-- **********************************
-- #Error: There is no student who got first rank

-- Update rank of student 503 to 'first'
UPDATE student SET ranks = 'first' WHERE sno = 503;

-- Run the PL/SQL block again:
-- Output (after update):
-- Student No: 503 Name: ravi got first rank
