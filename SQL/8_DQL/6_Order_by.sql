/*
============================================
1. What is DQL and its Role in SQL
============================================
Data Query Language (DQL) is a subset of SQL focused on retrieving and organizing data from a database.
The primary command in DQL is SELECT, which allows querying specific columns, filtering rows, and sorting data.
ORDER BY is a crucial part of DQL for sorting query results in ascending or descending order.
*/

/*
============================================
2. The ORDER BY Clause: Syntax and Purpose
============================================
The ORDER BY clause sorts the results of a query based on one or more columns or expressions.
By default, it sorts in ascending order unless specified otherwise.

Syntax:
SELECT column1, column2
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC];
*/

-- Example: Basic ORDER BY in Ascending Order (default)
SELECT employee_name, salary
FROM employees
ORDER BY salary;

-- Example: ORDER BY in Descending Order
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC;

/*
============================================
3. Sorting Options: ASC and DESC
============================================
- ASC: Ascending order (default behavior of ORDER BY).
- DESC: Descending order, used to reverse the default sorting order.
*/

-- Example: Sorting by Multiple Columns
SELECT employee_name, department, salary
FROM employees
ORDER BY department ASC, salary DESC;

/*
============================================
4. Using Expressions and Functions in ORDER BY
============================================
ORDER BY can sort based on expressions, calculated columns, or functions applied to columns.
*/

-- Example: Sorting by a Calculated Field
SELECT employee_name, salary, salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

-- Example: Using a Function in ORDER BY
SELECT employee_name, hire_date
FROM employees
ORDER BY YEAR(hire_date) ASC;

/*
============================================
5. Best Practices and Performance Considerations
============================================
- Minimize sorting large datasets by filtering rows first using WHERE.
- Use indexes on columns used in ORDER BY to improve performance.
- Avoid unnecessary sorting operations by understanding query requirements.
*/

-- Optimized Example with Indexing
CREATE INDEX idx_salary ON employees(salary);
SELECT employee_name, salary
FROM employees
ORDER BY salary;

/*
============================================
6. Common Pitfalls to Avoid
============================================
- Sorting by non-existent columns: Ensure column names are valid.
- Ignoring performance impacts of sorting large datasets.
- Misusing ASC and DESC, leading to unexpected results.
*/

-- Example: Sorting Non-Existent Column (Incorrect)
-- SELECT employee_name
-- FROM employees
-- ORDER BY non_existent_column; -- Error: Invalid column name.

/*
============================================
7. Practical Examples: Advanced Usage
============================================
*/

-- Example: Combining ORDER BY with LIMIT
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5; -- Top 5 highest salaries

-- Example: Sorting with NULL Values
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC NULLS LAST; -- Puts NULLs at the end

-- Example: ORDER BY with Aliased Columns
SELECT employee_name, salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

/*
============================================
8. Expected Output and Usage
============================================
The ORDER BY clause allows structured and meaningful presentation of query results.
It is commonly used in reports, dashboards, and analytical queries.
Ensure to test queries for edge cases, such as NULL values and large datasets.
*/