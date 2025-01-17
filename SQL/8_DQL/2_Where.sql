/*
============================================
1. What is Data Query Language (DQL)?
============================================
DQL is a subset of SQL commands used to retrieve and query data from databases.
The SELECT statement is the primary command in DQL, enabling users to fetch specific data based on various conditions.
*/

-- Example: Basic SELECT statement
SELECT * FROM employees;

/*
============================================
2. The Purpose and Importance of the WHERE Clause
============================================
The WHERE clause is used to filter records based on specified conditions.
It is essential for retrieving only the relevant rows from a table, improving both accuracy and performance of queries.
*/

-- Example: Fetch employees from a specific department
SELECT * FROM employees WHERE department = 'Sales';

/*
============================================
3. Syntax and Structure of the WHERE Clause
============================================
Syntax:
SELECT column1, column2, ...
FROM table_name
WHERE condition;

- The condition specifies the filtering criteria.
- It can include comparison operators, logical operators, and special operators.
*/

-- Example: Select employees with a salary greater than 50000
SELECT first_name, last_name, salary FROM employees WHERE salary > 50000;

/*
============================================
4. Operators Used in the WHERE Clause
============================================
A. Comparison Operators:
- =, != (or <>), >, <, >=, <=

B. Logical Operators:
- AND, OR, NOT

C. Special Operators:
- IN: Matches values in a list.
- BETWEEN: Checks if a value is within a range.
- LIKE: Matches patterns using wildcards (% for any sequence of characters, _ for a single character).
- IS NULL: Checks for NULL values.
*/

-- Example: Comparison operators
SELECT first_name, salary FROM employees WHERE salary >= 60000;

-- Example: Logical operators
SELECT first_name, last_name FROM employees
WHERE department = 'IT' AND salary > 50000;

SELECT first_name, last_name FROM employees
WHERE department = 'IT' OR salary > 50000;

-- Example: Special operators
-- Using IN to match multiple values
SELECT first_name, department FROM employees WHERE department IN ('HR', 'Finance', 'Marketing');

-- Using BETWEEN to find values in a range
SELECT first_name, salary FROM employees WHERE salary BETWEEN 40000 AND 70000;

-- Using LIKE for pattern matching
SELECT first_name FROM employees WHERE first_name LIKE 'A%';

-- Using IS NULL to handle NULL values
SELECT first_name, bonus FROM employees WHERE bonus IS NULL;

/*
============================================
5. Practical Examples
============================================
A. Simple WHERE conditions
*/
-- Example: Retrieve employees with the title "Manager"
SELECT first_name, last_name, title FROM employees WHERE title = 'Manager';

/*
B. Complex conditions using AND/OR
*/
-- Example: Retrieve employees from the IT department with a salary over 60000 or from HR with a salary over 50000
SELECT first_name, department, salary FROM employees
WHERE (department = 'IT' AND salary > 60000) OR (department = 'HR' AND salary > 50000);

/*
C. Pattern matching using LIKE
*/
-- Example: Retrieve employees whose last name starts with "S"
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'S%';

/*
D. Range testing using BETWEEN
*/
-- Example: Retrieve employees hired between 2015 and 2020
SELECT first_name, hire_date FROM employees WHERE hire_date BETWEEN '2015-01-01' AND '2020-12-31';

/*
E. Multiple value testing using IN
*/
-- Example: Retrieve employees from specific departments
SELECT first_name, department FROM employees WHERE department IN ('Sales', 'IT', 'Finance');

/*
F. NULL value handling
*/
-- Example: Retrieve employees who do not have an assigned bonus
SELECT first_name, bonus FROM employees WHERE bonus IS NULL;

/*
============================================
6. Best Practices and Common Pitfalls
============================================
Best Practices:
- Use indexed columns in the WHERE clause for better performance.
- Be specific with conditions to avoid unnecessary scans.
- Handle NULL values explicitly to prevent unexpected results.

Common Pitfalls:
- Forgetting to handle NULL values in conditions.
- Using complex conditions without indexing, which can degrade performance.
- Overusing wildcards in LIKE patterns, which can be inefficient.
*/

/*
============================================
7. Performance Considerations and Optimization Tips
============================================
- Use EXPLAIN or query execution plans to analyze performance.
- Avoid functions or calculations on indexed columns in the WHERE clause.
- Combine multiple conditions using logical operators carefully.
- Limit the use of wildcards (% or _) at the beginning of LIKE patterns.
*/