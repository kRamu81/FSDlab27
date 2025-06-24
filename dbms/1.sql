-- Step 1: Create 'rank' table
CREATE TABLE rank (
    sno INT PRIMARY KEY,
    name VARCHAR(20),
    rollno VARCHAR(20),
    marks INT CHECK (marks >= 0 AND marks <= 100),
    email VARCHAR(50) UNIQUE
);

-- Step 2: Insert one record (rollno will be NULL)
INSERT INTO rank (sno, name, marks, email)
VALUES (1, 'ramu', 85, 'kanam@gmail');

-- Step 3: View the table contents
SELECT * FROM rank;
-- Output:
-- | SNO | NAME | ROLLNO | MARKS |     EMAIL      |
-- |-----|------|--------|-------|----------------|
-- |  1  | ramu |  NULL  |  85   | kanam@gmail    |

-- Step 4: Add a new column 'branch'
ALTER TABLE rank ADD branch VARCHAR(30);

-- Step 5: View table after ALTER
SELECT * FROM rank;
-- Output:
-- | SNO | NAME | ROLLNO | MARKS |     EMAIL      | BRANCH |
-- |-----|------|--------|-------|----------------|--------|
-- |  1  | ramu |  NULL  |  85   | kanam@gmail    |  NULL  |

-- Step 6: Drop the table
DROP TABLE rank;
-- Output: Table dropped successfully (no rows returned)
