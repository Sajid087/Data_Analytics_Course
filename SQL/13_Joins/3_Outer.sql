/*
=============================================
1. Concept and Purpose of Outer Joins
=============================================
Outer joins are used to retrieve matching rows from two or more tables, as well as unmatched rows from one or both tables.
Outer joins are essential when you want to include all data from one table and only the matching data from another table.

Types of outer joins:
- LEFT OUTER JOIN: Includes all rows from the left table and matching rows from the right table.
- RIGHT OUTER JOIN: Includes all rows from the right table and matching rows from the left table.
- FULL OUTER JOIN: Includes all rows from both tables, with NULLs for non-matching rows.
*/

/*
=============================================
2. Syntax and Structure of Outer Joins
=============================================
Syntax:
LEFT OUTER JOIN:
SELECT columns
FROM table1
LEFT OUTER JOIN table2
ON table1.common_column = table2.common_column;

RIGHT OUTER JOIN:
SELECT columns
FROM table1
RIGHT OUTER JOIN table2
ON table1.common_column = table2.common_column;

FULL OUTER JOIN:
SELECT columns
FROM table1
FULL OUTER JOIN table2
ON table1.common_column = table2.common_column;
*/

/*
=============================================
3. Sample Tables
=============================================
Employees Table:
+----+-------------+------------+
| ID | Name        | Dept_ID    |
+----+-------------+------------+
| 1  | Alice       | 101        |
| 2  | Bob         | 102        |
| 3  | Charlie     | NULL       |
+----+-------------+------------+

Departments Table:
+--------+--------------+
| Dept_ID| Dept_Name    |
+--------+--------------+
| 101    | HR           |
| 102    | IT           |
| 103    | Finance      |
+--------+--------------+
*/

-- Creating sample tables
CREATE TABLE Employees (
    ID INT,
    Name VARCHAR(50),
    Dept_ID INT
);

CREATE TABLE Departments (
    Dept_ID INT,
    Dept_Name VARCHAR(50)
);

-- Inserting sample data
INSERT INTO Employees (ID, Name, Dept_ID) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', NULL);

INSERT INTO Departments (Dept_ID, Dept_Name) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');

/*
=============================================
4. LEFT OUTER JOIN Examples
=============================================
Description: Retrieves all rows from the Employees table and matching rows from the Departments table.
Non-matching rows in Departments will have NULLs.
*/

SELECT e.ID, e.Name, d.Dept_Name
FROM Employees e
LEFT OUTER JOIN Departments d
ON e.Dept_ID = d.Dept_ID;

-- Expected Output:
-- +----+---------+------------+
-- | ID | Name    | Dept_Name  |
-- +----+---------+------------+
-- | 1  | Alice   | HR         |
-- | 2  | Bob     | IT         |
-- | 3  | Charlie | NULL       |
-- +----+---------+------------+

/*
=============================================
5. RIGHT OUTER JOIN Examples
=============================================
Description: Retrieves all rows from the Departments table and matching rows from the Employees table.
Non-matching rows in Employees will have NULLs.
*/

SELECT e.ID, e.Name, d.Dept_Name
FROM Employees e
RIGHT OUTER JOIN Departments d
ON e.Dept_ID = d.Dept_ID;

-- Expected Output:
-- +----+---------+------------+
-- | ID | Name    | Dept_Name  |
-- +----+---------+------------+
-- | 1  | Alice   | HR         |
-- | 2  | Bob     | IT         |
-- | NULL | NULL  | Finance    |
-- +----+---------+------------+

/*
=============================================
6. FULL OUTER JOIN Examples
=============================================
Description: Retrieves all rows from both tables, with NULLs for non-matching rows.
*/

SELECT e.ID, e.Name, d.Dept_Name
FROM Employees e
FULL OUTER JOIN Departments d
ON e.Dept_ID = d.Dept_ID;

-- Expected Output:
-- +----+---------+------------+
-- | ID | Name    | Dept_Name  |
-- +----+---------+------------+
-- | 1  | Alice   | HR         |
-- | 2  | Bob     | IT         |
-- | 3  | Charlie | NULL       |
-- | NULL | NULL  | Finance    |
-- +----+---------+------------+

/*
=============================================
7. Real-World Use Cases
=============================================
- LEFT OUTER JOIN: Retrieve employees and their departments, showing employees without departments.
- RIGHT OUTER JOIN: Retrieve departments and their employees, showing departments without employees.
- FULL OUTER JOIN: Generate a complete dataset of all employees and departments, regardless of matches.
*/

/*
=============================================
8. Common Pitfalls and Best Practices
=============================================
- Ensure proper indexing on join columns to optimize performance.
- Be cautious with FULL OUTER JOIN on large datasets due to potential performance issues.
- Avoid unnecessary outer joins if data completeness isn’t required.
*/

/*
=============================================
9. ASCII Art Representations
=============================================
LEFT OUTER JOIN:
Employees (All Rows) +---+ Matching Departments
RIGHT OUTER JOIN:
Departments (All Rows) +---+ Matching Employees
FULL OUTER JOIN:
All Rows from Employees +---+ All Rows from Departments
*/