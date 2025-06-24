/*
---------------------------------------------------------
🔵 NULLIF Function in SQL
---------------------------------------------------------

🔹 SYNTAX:
NULLIF(expression1, expression2)

👉 If expression1 = expression2 → returns NULL  
👉 Else → returns expression1

Example: NULLIF('ali', 'ali1') → returns 'ali' (because they are NOT equal)
         NULLIF('ali', 'ali')  → returns NULL (because they are equal)
---------------------------------------------------------
*/


-- 🔸 Step 1: Create the emp table
CREATE TABLE emp (
  eno NUMBER(5),
  ename VARCHAR2(10),
  loc VARCHAR2(10),
  salary NUMBER(10,2)
);

-- 🔸 Step 2: Insert sample data
INSERT INTO emp VALUES (101, 'ali', 'vja', 15000);
INSERT INTO emp VALUES (102, 'ravi', 'hyd', 25000);
INSERT INTO emp VALUES (103, 'raju', 'gnt', 35000);
INSERT INTO emp VALUES (104, 'rakesh', 'vja', 45000);

-- 🔸 Step 3: NULLIF example using constants
SELECT ename, NULLIF('ali', 'ali1') AS nulif_value FROM emp;

-- ✅ Output:
-- +--------+--------------+
-- | ENAME  | NULIF_VALUE  |
-- +--------+--------------+
-- | ali    | ali          |
-- | ravi   | ali          |
-- | raju   | ali          |
-- | rakesh | ali          |
-- +--------+--------------+

/*
📌 Explanation:
'ali' ≠ 'ali1' → So NULLIF returns the first value, i.e., 'ali' in all rows.
Since it's not column-based comparison, the result is the same for all rows.
*/
