/*
===========================
1. What is SQL?
===========================
SQL (Structured Query Language) is a standard programming language designed for managing and manipulating relational databases. It enables users to perform operations such as querying data, updating records, and managing database schemas.
*/
-- Example: Selecting data from a table
SELECT * FROM employees;

/*
===========================
2. Historical Development
===========================
SQL originated in the early 1970s as part of IBM's System R project. It was formalized as an ANSI standard in 1986 and has since become the standard language for relational database management systems (RDBMS). Modern implementations include MySQL, PostgreSQL, Oracle, and SQL Server.
*/
-- Example: A modern SQL query remains consistent across flavors
SELECT name, salary FROM employees WHERE department = 'Engineering';

/*
===========================
3. Fundamental Purposes and Use Cases
===========================
SQL is primarily used for:
- Data Querying
- Data Definition (creating and altering database structures)
- Data Manipulation (inserting, updating, deleting data)
- Access Control and Data Security
*/
-- Example: Updating data in a table
UPDATE employees SET salary = salary * 1.1 WHERE performance_rating = 'Excellent';

/*
===========================
4. Key SQL Concepts
===========================
- DDL (Data Definition Language): Commands to define database structures (CREATE, ALTER, DROP).
- DML (Data Manipulation Language): Commands to manipulate data (SELECT, INSERT, UPDATE, DELETE).
- DCL (Data Control Language): Commands to control access (GRANT, REVOKE).
- TCL (Transaction Control Language): Commands to manage transactions (COMMIT, ROLLBACK, SAVEPOINT).
*/
-- Example: Creating a table (DDL)
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    performance_rating VARCHAR(10)
);

-- Example: Inserting data (DML)
INSERT INTO employees (id, name, department, salary, performance_rating)
VALUES (1, 'Alice', 'Engineering', 75000.00, 'Excellent');

-- Example: Granting permissions (DCL)
GRANT SELECT, INSERT ON employees TO user_read_write;

-- Example: Rolling back a transaction (TCL)
BEGIN;
UPDATE employees SET salary = 0 WHERE id = 1; -- Intentional mistake
ROLLBACK;

/*
===========================
5. Core SQL Components
===========================
- Tables: Store data in rows and columns.
- Views: Virtual tables created by querying existing tables.
- Stored Procedures: Predefined SQL code for repeated tasks.
- Triggers: Automated actions invoked by database events.
*/
-- Example: Creating a view
CREATE VIEW high_salary_employees AS
SELECT name, department, salary FROM employees WHERE salary > 80000;

-- Example: Creating a stored procedure
CREATE PROCEDURE increase_salary(dept VARCHAR(50), increment DECIMAL(5, 2))
AS
BEGIN
    UPDATE employees
    SET salary = salary + increment
    WHERE department = dept;
END;

-- Example: Creating a trigger
CREATE TRIGGER audit_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action, employee_id, timestamp)
    VALUES ('UPDATE', NEW.id, CURRENT_TIMESTAMP);
END;

/*
===========================
6. Major SQL Flavors
===========================
Popular RDBMS implementing SQL:
- MySQL: Open-source, widely used for web applications.
- PostgreSQL: Advanced open-source RDBMS with strong features.
- Oracle: Enterprise-grade, highly scalable RDBMS.
- SQL Server: Microsoft’s RDBMS with BI tools integration.
*/
-- Example: MySQL-specific syntax
SHOW DATABASES;

-- Example: PostgreSQL-specific syntax
CREATE INDEX idx_salary ON employees (salary);

/*
===========================
7. Basic to Advanced SQL Commands
===========================
*/
-- Basic: Selecting specific columns
SELECT name, department FROM employees WHERE salary > 60000;

-- Intermediate: Joining tables
SELECT e.name, d.department_name
FROM employees e
JOIN departments d ON e.department = d.department_id;

-- Advanced: Window functions
SELECT name, department, salary, RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM employees;

/*
===========================
8. Best Practices and Optimization Techniques
===========================
- Use proper indexing to speed up queries.
- Avoid SELECT *; specify required columns.
- Normalize database design to reduce redundancy.
- Use EXPLAIN to analyze query performance.
- Optimize joins and subqueries.
*/
-- Example: Using EXPLAIN to analyze query performance
EXPLAIN SELECT name, department FROM employees WHERE salary > 60000;

-- Example: Adding an index to improve query performance
CREATE INDEX idx_department_salary ON employees (department, salary);