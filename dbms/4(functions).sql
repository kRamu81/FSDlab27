-- Step 1: Create the student table
CREATE TABLE student (
    sno NUMBER,
    name VARCHAR2(30),
    salary NUMBER,
    joindate DATE
);

-- Step 2: Insert data into student table
INSERT INTO student VALUES (1, 'rameash', 50000, TO_DATE('2022-05-14', 'YYYY-MM-DD'));
INSERT INTO student VALUES (2, 'saijohn', 60000, TO_DATE('2022-12-05', 'YYYY-MM-DD'));
INSERT INTO student VALUES (3, 'sitash', 30000, TO_DATE('2021-01-01', 'YYYY-MM-DD'));

-- Step 3: View table data
SELECT * FROM student;
-- Output:
-- | SNO | NAME    | SALARY | JOINDATE  |
-- |-----|---------|--------|-----------|
-- | 1   | rameash | 50000  | 14-MAY-22 |
-- | 2   | saijohn | 60000  | 05-DEC-22 |
-- | 3   | sitash  | 30000  | 01-JAN-21 |

-----------------------------------------------------
-- Step 4: Conversion Functions
SELECT 
    TO_CHAR(joindate, 'DD-Mon-YYYY') AS join_date_formatted,
    TO_NUMBER('12345') AS converted_number,
    TO_DATE('24-06-2025', 'DD-MM-YYYY') AS converted_date
FROM student WHERE ROWNUM = 1;
-- Output:
-- | JOIN_DATE_FORMATTED | CONVERTED_NUMBER | CONVERTED_DATE |
-- |---------------------|------------------|----------------|
-- | 14-May-2022         | 12345            | 24-JUN-25      |

-----------------------------------------------------
-- Step 5: String Functions
SELECT 
    name,
    CONCAT(name, ' Kumar') AS full_name,
    LPAD(name, 10, '*') AS name_lpad,
    RPAD(name, 10, '-') AS name_rpad,
    LTRIM('   ' || name) AS name_ltrim,
    RTRIM(name || '   ') AS name_rtrim,
    LOWER(name) AS lower_name,
    UPPER(name) AS upper_name,
    INITCAP(name) AS initcap_name,
    LENGTH(name) AS name_length,
    SUBSTR(name, 1, 3) AS name_substr,
    INSTR(name, 'a') AS first_a_position
FROM student;
-- Output Example:
-- | name    | full_name    | lpad      | rpad      | ltrim   | rtrim   | lower    | upper    | initcap  | len | sub | pos |
-- |---------|--------------|-----------|-----------|---------|---------|----------|----------|----------|-----|-----|-----|
-- | rameash | rameash Kumar| ***rameash| rameash---| rameash | rameash | rameash  | RAMEASH  | Rameash  | 7   | ram | 2   |
-- | saijohn | saijohn Kumar| **saijohn | saijohn---| saijohn | saijohn | saijohn  | SAIJOHN  | Saijohn  | 7   | sai | 2   |
-- | sitash  | sitash Kumar | ***sitash | sitash----| sitash  | sitash  | sitash   | SITASH   | Sitash   | 6   | sit | 4   |

-----------------------------------------------------
-- Step 6: Date Functions (Assuming SYSDATE is 24-JUN-2025)
SELECT 
    joindate,
    SYSDATE AS today,
    NEXT_DAY(joindate, 'FRIDAY') AS next_friday,
    ADD_MONTHS(joindate, 3) AS add_3_months,
    LAST_DAY(joindate) AS last_day_of_month,
    MONTHS_BETWEEN(SYSDATE, joindate) AS months_worked,
    LEAST(joindate, SYSDATE) AS least_date,
    GREATEST(joindate, SYSDATE) AS greatest_date,
    TRUNC(joindate) AS truncated_date,
    ROUND(joindate, 'MONTH') AS rounded_to_month,
    TO_CHAR(joindate, 'Month YYYY') AS char_format,
    TO_DATE('01-JAN-2023', 'DD-MON-YYYY') AS fixed_date
FROM student;

-- Output Example:
-- | JOINDATE  | TODAY     | NEXT_FRIDAY | ADD_3_MONTHS | LAST_DAY  | MONTHS_BETWEEN | LEAST     | GREATEST  | TRUNC     | ROUND     | CHAR_FORMAT  | FIXED_DATE |
-- |-----------|-----------|-------------|--------------|-----------|----------------|-----------|------------|-----------|-----------|--------------|-------------|
-- |14-MAY-22  |24-JUN-25  |20-MAY-22    |14-AUG-22     |31-MAY-22  | 37.3           |14-MAY-22  |24-JUN-25   |14-MAY-22  |01-MAY-22  | May     2022 |01-JAN-2023 |
-- |05-DEC-22  |24-JUN-25  |09-DEC-22    |05-MAR-23     |31-DEC-22  | 30.6           |05-DEC-22  |24-JUN-25   |05-DEC-22  |01-DEC-22  | December 2022|01-JAN-2023 |
-- |01-JAN-21  |24-JUN-25  |08-JAN-21    |01-APR-21     |31-JAN-21  | 53.8           |01-JAN-21  |24-JUN-25   |01-JAN-21  |01-JAN-21  | January 2021 |01-JAN-2023 |
