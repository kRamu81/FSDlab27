-- Create table
CREATE TABLE rank (
    sno INT PRIMARY KEY,
    name VARCHAR(20),
    rollno VARCHAR(20),
    marks INT CHECK (marks >= 0 AND marks <= 100),
    email VARCHAR(50) UNIQUE
);

-- Insert data (works fine)
INSERT INTO rank (sno, name, marks, email)
VALUES (1, 'ramu', 85, 'kanam@gmail');

-- View table
SELECT * FROM rank;




ALTER TABLE rank ADD branch VARCHAR(30);

-- View table again
SELECT * FROM rank;

drop table rank;


