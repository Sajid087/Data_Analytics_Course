/*
====================================
1. Definition of DML
====================================
Data Manipulation Language (DML) is a subset of SQL used to interact with data stored in a database. 
DML commands are used for querying, inserting, updating, and deleting records from database tables.

Key characteristics of DML:
- Operates on the data within database objects (e.g., tables).
- Commonly used for CRUD operations (Create, Read, Update, Delete).
- Works in conjunction with transactions to ensure data consistency.
*/

/*
====================================
2. Main DML Commands
====================================
The primary DML commands are:
- SELECT: Retrieves data from one or more tables.
- INSERT: Adds new records to a table.
- UPDATE: Modifies existing records in a table.
- DELETE: Removes records from a table.
*/

/*
====================================
3. SELECT Command
====================================
Purpose: Retrieves data from one or more tables.
Syntax:
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/
-- Example: Basic SELECT query
SELECT first_name, last_name
FROM employees
WHERE department_id = 10;

-- Example: SELECT with sorting and filtering
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

-- Example: SELECT with aggregate functions
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 60000;

/*
====================================
4. INSERT Command
====================================
Purpose: Adds new records to a table.
Syntax:
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
*/
-- Example: Basic INSERT statement
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary)
VALUES (101, 'John', 'Doe', 10, 55000);

-- Example: INSERT multiple rows
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary)
VALUES
(102, 'Jane', 'Smith', 20, 60000),
(103, 'Mike', 'Brown', 30, 75000);

/*
====================================
5. UPDATE Command
====================================
Purpose: Modifies existing records in a table.
Syntax:
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
*/
-- Example: Update a single record
UPDATE employees
SET salary = 58000
WHERE employee_id = 101;

-- Example: Update multiple records
UPDATE employees
SET salary = salary * 1.1
WHERE department_id = 10;

/*
====================================
6. DELETE Command
====================================
Purpose: Removes records from a table.
Syntax:
DELETE FROM table_name
WHERE condition;
*/
-- Example: Delete a single record
DELETE FROM employees
WHERE employee_id = 103;

-- Example: Delete multiple records
DELETE FROM employees
WHERE department_id = 20;

-- Note: Be cautious when using DELETE without a WHERE clause as it removes all rows from the table.

/*
====================================
7. Best Practices for Using DML Commands
====================================
- Always use a WHERE clause with UPDATE and DELETE to avoid unintentional modifications or deletions.
- Test DML commands on a development database before executing them on production.
- Use parameterized queries in application code to prevent SQL injection.
- Limit SELECT queries with filters and pagination for large datasets.
*/

/*
====================================
8. Performance Considerations and Optimization Tips
====================================
- Use indexes to speed up SELECT queries.
- Minimize the number of rows affected by UPDATE and DELETE operations.
- Avoid SELECT *; specify only the required columns.
- Use bulk INSERT for adding large datasets efficiently.
- Analyze and optimize query execution plans.
*/
