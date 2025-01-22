-- ==============================
-- 1. Definition and Purpose
-- ==============================
/*
A View is a virtual table in SQL that is based on the result of a SELECT query. It does not store data itself but provides a way to simplify complex queries,
secure sensitive data, and abstract the underlying database structure from the user.

Purpose:
- Simplify complex queries by encapsulating them in a View.
- Provide a layer of security by exposing only specific columns or rows.
- Enable data abstraction for easier management.
*/

-- Example Schema:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Employees VALUES (1, 'John', 'Doe', 1, 60000.00);
INSERT INTO Employees VALUES (2, 'Jane', 'Smith', 2, 80000.00);
INSERT INTO Departments VALUES (1, 'Engineering');
INSERT INTO Departments VALUES (2, 'Marketing');

-- ==============================
-- 2. Types of Views
-- ==============================
/*
Views can be categorized as follows:

1. Simple Views:
   - Based on a single table.
   - Do not include functions, joins, or groupings.

2. Complex Views:
   - Can include multiple tables, joins, functions, or aggregations.

3. Indexed Views (SQL Server-specific):
   - Materialized views that store the result set.
   - Improve performance for frequently accessed queries.

4. Materialized Views:
   - Store data physically, unlike regular Views.
   - Must be refreshed manually or automatically.
*/

-- Simple View Example:
CREATE VIEW EmployeeNames AS
SELECT EmployeeID, FirstName, LastName
FROM Employees;

-- Complex View Example:
CREATE VIEW EmployeeDetails AS
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentName, E.Salary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- ==============================
-- 3. Advantages and Disadvantages
-- ==============================
/*
Advantages:
- Simplifies complex queries.
- Provides a security layer by exposing only specific data.
- Enables data abstraction for easier maintenance.
- Supports reusable queries.

Disadvantages:
- Performance overhead for complex Views.
- Limited write capabilities (non-updatable Views).
- Dependencies can complicate schema changes.
*/

-- ==============================
-- 4. Best Practices and Performance Considerations
-- ==============================
/*
Best Practices:
- Keep Views simple to avoid performance overhead.
- Avoid SELECT *; explicitly specify columns.
- Use Indexed or Materialized Views for performance-critical queries.
- Monitor dependencies to avoid breaking Views during schema changes.

Performance Considerations:
- Regular Views are recalculated each time they are queried.
- Indexed/Materialized Views store data and can improve performance but require storage space and maintenance.
*/

-- ==============================
-- 5. Security Implications and Permissions
-- ==============================
/*
Views provide a security mechanism by restricting direct access to base tables.

- Use Views to expose only necessary columns/rows.
- Apply appropriate permissions to restrict access to the View.
*/

-- Granting Permissions:
GRANT SELECT ON EmployeeDetails TO public;

-- ==============================
-- 6. Syntax for Creating, Modifying, and Dropping Views
-- ==============================

-- Creating a View:
CREATE VIEW ViewName AS
SELECT column1, column2
FROM TableName
WHERE condition;

-- Modifying a View:
ALTER VIEW EmployeeNames AS
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

-- Dropping a View:
DROP VIEW EmployeeNames;

-- ==============================
-- 7. Common Use Cases and Examples
-- ==============================

-- Data Abstraction:
CREATE VIEW DepartmentBudgets AS
SELECT D.DepartmentName, SUM(E.Salary) AS TotalBudget
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

-- Querying the View:
SELECT * FROM DepartmentBudgets;

-- Query Simplification:
CREATE VIEW HighEarners AS
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 75000;

-- Data Security:
CREATE VIEW PublicEmployeeDetails AS
SELECT FirstName, LastName, DepartmentID
FROM Employees;

-- ==============================
-- 8. Updatable and Non-Updatable Views
-- ==============================
/*
- A View is updatable if it is based on a single table without aggregations or DISTINCT.
- Complex Views with joins or aggregations are generally non-updatable.
*/

-- Example of an Updatable View:
CREATE VIEW SimpleEmployeeView AS
SELECT EmployeeID, FirstName, LastName
FROM Employees;

UPDATE SimpleEmployeeView
SET FirstName = 'Jonathan'
WHERE EmployeeID = 1;

-- ==============================
-- 9. View Dependencies and Maintenance
-- ==============================
/*
- Views depend on the underlying table structure.
- Use system catalog views or metadata queries to track dependencies.
*/

-- Checking Dependencies:
SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'EmployeeDetails';

-- ==============================
-- 10. Conclusion
-- ==============================
/*
SQL Views are a powerful tool for simplifying queries, enhancing security, and improving database management. While they provide many benefits, proper care must be taken to avoid performance issues and manage dependencies effectively.
*/