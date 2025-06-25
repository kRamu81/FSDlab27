Here is a description and syntax-only guide for writing your DBMS lab record based on the structure you've provided (EXE 1 to EXE 9). No full code is included, only brief descriptions and syntax formats.


---

✅ EXE - 1: Table Creation, Alteration, Dropping, Inserting Rows, SELECT with Constraints

📌 Description:

This exercise involves:

Creating tables using constraints like PRIMARY KEY, UNIQUE, NOT NULL, CHECK, and FOREIGN KEY.

Altering table structure (adding/modifying columns).

Dropping tables.

Inserting rows into the table.

Using SELECT to retrieve data.


🧾 Syntax:

CREATE TABLE table_name (
    column1 datatype CONSTRAINT constraint_name constraint_type,
    column2 datatype,
    ...
);

ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name MODIFY column_name datatype;
ALTER TABLE table_name DROP COLUMN column_name;

DROP TABLE table_name;

INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);

SELECT * FROM table_name;
SELECT column1, column2 FROM table_name WHERE condition;


---

✅ EXE - 2: Queries using ANY, ALL, IN, EXISTS, NOT EXISTS, UNION, INTERSECT, Constraints

📌 Description:

This includes:

Using subqueries and logical operators to filter data.

Performing set operations like UNION, INTERSECT.

Querying using EXISTS, IN, ANY, ALL, etc.


🧾 Syntax:

SELECT column FROM table WHERE column IN (subquery);
SELECT column FROM table WHERE column = ANY (subquery);
SELECT column FROM table WHERE column > ALL (subquery);

SELECT column FROM table WHERE EXISTS (subquery);
SELECT column FROM table WHERE NOT EXISTS (subquery);

SELECT column FROM table1
UNION
SELECT column FROM table2;

SELECT column FROM table1
INTERSECT
SELECT column FROM table2;


---

✅ EXE - 3: Aggregate Functions, GROUP BY, HAVING, Views

📌 Description:

Perform aggregate operations and group data:

Using COUNT, SUM, AVG, MIN, MAX.

Grouping results using GROUP BY and filtering groups with HAVING.

Creating and dropping views.


🧾 Syntax:

SELECT COUNT(*), AVG(column), SUM(column), MIN(column), MAX(column) FROM table;

SELECT column, COUNT(*) FROM table
GROUP BY column
HAVING COUNT(*) > value;

CREATE VIEW view_name AS
SELECT column1, column2 FROM table WHERE condition;

DROP VIEW view_name;


---

✅ EXE - 4: String, Conversion, and Date Functions

📌 Description:

Use built-in SQL functions to:

Convert between data types.

Manipulate strings.

Perform date calculations.


🧾 Syntax:

-- String Functions
SELECT CONCAT(col1, col2), LPAD(col, n, 'x'), RPAD(col, n, 'x'), 
LTRIM(col), RTRIM(col), LOWER(col), UPPER(col), INITCAP(col),
LENGTH(col), SUBSTR(col, start, length), INSTR(col, 'substr') FROM table;

-- Conversion Functions
SELECT TO_CHAR(date_col, 'format'), TO_DATE('string', 'format'), TO_NUMBER('string') FROM dual;

-- Date Functions
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'MONDAY'), ADD_MONTHS(SYSDATE, 1), 
LAST_DAY(SYSDATE), MONTHS_BETWEEN(date1, date2), 
LEAST(date1, date2), GREATEST(date1, date2), 
TRUNC(SYSDATE), ROUND(SYSDATE) FROM dual;


---

✅ EXE - 5: Basic PL/SQL Block with Exception Handling, COMMIT, ROLLBACK, SAVEPOINT

📌 Description:

Write a PL/SQL block with:

Declaration, execution, and exception sections.

Use of COMMIT, ROLLBACK, and SAVEPOINT.


🧾 Syntax:

DECLARE
  -- Variable declarations
BEGIN
  -- Executable statements
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    -- Handling
  WHEN OTHERS THEN
    -- Generic error
END;

-- COMMIT, ROLLBACK, SAVEPOINT
SAVEPOINT savepoint_name;
ROLLBACK TO savepoint_name;
COMMIT;
ROLLBACK;


---

✅ EXE - 6: NESTED IF, CASE, CASE Expression, NULLIF, COALESCE

📌 Description:

Control program flow using conditional statements:

Nested IF, CASE, CASE WHEN, NULLIF, and COALESCE.


🧾 Syntax:

IF condition THEN
  -- Statements
ELSIF another_condition THEN
  -- Statements
ELSE
  -- Statements
END IF;

CASE variable
  WHEN value1 THEN action1
  WHEN value2 THEN action2
  ELSE default_action
END CASE;

CASE
  WHEN condition1 THEN result1
  WHEN condition2 THEN result2
  ELSE default_result
END;

SELECT NULLIF(expr1, expr2) FROM dual;
SELECT COALESCE(expr1, expr2, ..., exprN) FROM dual;


---

✅ EXE - 7: WHILE, FOR, Nested Loops, Error Handling, Built-in and User-defined Exceptions

📌 Description:

Use loops and exception handling mechanisms:

WHILE, numeric FOR, nested loops.

Handling built-in and user-defined exceptions.

Raise errors using RAISE_APPLICATION_ERROR.


🧾 Syntax:

-- WHILE Loop
WHILE condition LOOP
  -- Statements
END LOOP;

-- Numeric FOR Loop
FOR i IN 1..10 LOOP
  -- Statements
END LOOP;

-- User-defined Exception
DECLARE
  e_custom EXCEPTION;
BEGIN
  IF some_condition THEN
    RAISE e_custom;
  END IF;
EXCEPTION
  WHEN e_custom THEN
    -- Handle user-defined exception
  WHEN OTHERS THEN
    -- Generic
END;

-- Raise Application Error
RAISE_APPLICATION_ERROR(-20001, 'Custom error message');


---

✅ EXE - 8: Procedures with IN and OUT Parameters

📌 Description:

Create and use stored procedures.

Accepting input (IN) and returning output (OUT) parameters.


🧾 Syntax:

CREATE OR REPLACE PROCEDURE procedure_name (
  param1 IN datatype,
  param2 OUT datatype
)
IS
BEGIN
  -- Procedure logic
END;

-- Calling the procedure
DECLARE
  var datatype;
BEGIN
  procedure_name(input_value, var);
  DBMS_OUTPUT.PUT_LINE(var);
END;


---

✅ EXE - 9: Functions and Complex Function Usage in SQL

📌 Description:

Create and use stored functions.

Call functions from SQL statements.

Implement logic-based or complex functions.


🧾 Syntax:

CREATE OR REPLACE FUNCTION function_name (
  param IN datatype
)
RETURN datatype
IS
  result datatype;
BEGIN
  -- Logic
  RETURN result;
END;

-- Calling function in SQL
SELECT function_name(value) FROM dual;


---

Let me know if you want this in a formatted Word or PDF version for lab submission.

