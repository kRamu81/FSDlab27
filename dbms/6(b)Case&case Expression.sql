/*
----------------------------------------------------
🔵 CASE and CASE Expression in SQL & PL/SQL
----------------------------------------------------

🔹 CASE EXPRESSION (Used in SQL SELECT/WHERE)

SYNTAX:
CASE expression
   WHEN value1 THEN result1
   WHEN value2 THEN result2
   ...
   ELSE default_result
END

📌 Used to return a value inside a SQL query.

-----------------------------------------------

🔹 CASE STATEMENT (Used in PL/SQL blocks)

SYNTAX:
CASE
   WHEN condition1 THEN
      -- statements
   WHEN condition2 THEN
      -- statements
   ...
   ELSE
      -- default statements
END CASE;

📌 Used to control logic flow (like IF-ELSE)

----------------------------------------------------
*/


-- 🔸 Step 1: Create the emp table
CREATE TABLE emp (
  eno NUMBER(5),
  ename VARCHAR2(10),
  loc VARCHAR2(10),
  salary NUMBER(10,2)
);

-- 🔸 Step 2: Insert employee data
INSERT INTO emp VALUES (101, 'ali', 'vja', 15000);
INSERT INTO emp VALUES (102, 'ravi', 'hyd', 25000);
INSERT INTO emp VALUES (103, 'raju', 'gnt', 35000);
INSERT INTO emp VALUES (104, 'rakesh', 'vja', 45000);

-- 🔸 Step 3: View data
SELECT * FROM emp;

-- ✅ OUTPUT:
-- +-----+--------+------+--------+
-- | ENO | ENAME  | LOC  | SALARY |
-- +-----+--------+------+--------+
-- | 101 | ali    | vja  | 15000  |
-- | 102 | ravi   | hyd  | 25000  |
-- | 103 | raju   | gnt  | 35000  |
-- | 104 | rakesh | vja  | 45000  |
-- +-----+--------+------+--------+


-- 🔸 Step 4: CASE Expression (used in SELECT query)
SELECT loc,
       CASE(loc)
         WHEN 'vja' THEN salary + 2000
         WHEN 'hyd' THEN salary + 1000
         ELSE salary
       END AS rev_salary
FROM emp;

-- ✅ OUTPUT:
-- +------+-------------+
-- | LOC  | REV_SALARY  |
-- +------+-------------+
-- | vja  | 17000       |
-- | hyd  | 26000       |
-- | gnt  | 35000       |
-- | vja  | 47000       |
-- +------+-------------+


-- 🔸 Step 5: CASE Statement in PL/SQL
SET SERVEROUTPUT ON;

DECLARE
  grade CHAR(1);
BEGIN
  grade := '&grade';  -- User will be prompted at runtime

  CASE 
    WHEN grade = 'a' THEN
      DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN grade = 'b' THEN
      DBMS_OUTPUT.PUT_LINE('Very good');
    WHEN grade = 'c' THEN
      DBMS_OUTPUT.PUT_LINE('Good');
    WHEN grade = 'd' THEN
      DBMS_OUTPUT.PUT_LINE('Fair');
    WHEN grade = 'f' THEN
      DBMS_OUTPUT.PUT_LINE('Poor');
    ELSE
      DBMS_OUTPUT.PUT_LINE('No such grade');
  END CASE;
END;
/

-- ✅ Sample Inputs and Outputs:
-- Input: a   → Output: Excellent
-- Input: b   → Output: Very good
-- Input: c   → Output: Good
-- Input: x   → Output: No such grade
