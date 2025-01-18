/*
============================================
1. Introduction to Multi-Row (Aggregate) Functions
============================================
Aggregate functions operate on multiple rows of data and return a single summary value for a group of rows.
They are commonly used with GROUP BY clauses to summarize data.

Aggregate functions are essential for data analysis, reporting, and summarizing large datasets.
*/

/*
============================================
2. Basic Aggregate Functions
============================================
*/

-- COUNT: Returns the number of rows or non-NULL values.
-- Syntax: COUNT(column_name | *)
-- Example: Count total employees in a company.
SELECT COUNT(*) AS total_employees
FROM employees;

-- Example: Count employees with a specific job title.
SELECT COUNT(job_title) AS specific_job_count
FROM employees
WHERE job_title = 'Manager';

-- SUM: Returns the total sum of a numeric column.
-- Syntax: SUM(column_name)
-- Example: Calculate total salaries of all employees.
SELECT SUM(salary) AS total_salaries
FROM employees;

-- AVG: Returns the average value of a numeric column.
-- Syntax: AVG(column_name)
-- Example: Calculate the average salary of employees.
SELECT AVG(salary) AS average_salary
FROM employees;

-- MAX: Returns the maximum value in a column.
-- Syntax: MAX(column_name)
-- Example: Find the highest salary in the company.
SELECT MAX(salary) AS highest_salary
FROM employees;

-- MIN: Returns the minimum value in a column.
-- Syntax: MIN(column_name)
-- Example: Find the lowest salary in the company.
SELECT MIN(salary) AS lowest_salary
FROM employees;

/*
============================================
3. Statistical Functions
============================================
*/

-- STDDEV: Calculates the standard deviation of a numeric column.
-- Syntax: STDDEV(column_name)
-- Example: Find the standard deviation of salaries.
SELECT STDDEV(salary) AS salary_std_dev
FROM employees;

-- VARIANCE: Calculates the variance of a numeric column.
-- Syntax: VARIANCE(column_name)
-- Example: Find the variance in salaries.
SELECT VARIANCE(salary) AS salary_variance
FROM employees;

-- MEDIAN: Returns the median value of a numeric column.
-- Syntax: MEDIAN(column_name)
-- Example: Find the median salary.
SELECT MEDIAN(salary) AS median_salary
FROM employees;

/*
============================================
4. Advanced Aggregate Functions
============================================
*/

-- LISTAGG: Concatenates values into a single string, separated by a delimiter.
-- Syntax: LISTAGG(column_name, delimiter)
-- Example: List all employee names in a single string.
SELECT LISTAGG(employee_name, ', ') WITHIN GROUP (ORDER BY employee_name) AS all_employees
FROM employees;

-- STRING_AGG (PostgreSQL): Similar to LISTAGG, used for string concatenation.
-- Example: Concatenate department names.
SELECT STRING_AGG(department_name, ', ') AS department_list
FROM departments;

-- GROUP_CONCAT (MySQL): Concatenates values into a string with a delimiter.
-- Example: Concatenate project names.
SELECT GROUP_CONCAT(project_name SEPARATOR '; ') AS project_list
FROM projects;

/*
============================================
5. Conditional Aggregate Functions
============================================
*/

-- Using FILTER Clause: Applies a condition to aggregate calculations.
-- Example: Sum salaries only for employees in a specific department.
SELECT department_id,
       SUM(salary) FILTER (WHERE job_title = 'Manager') AS manager_salaries
FROM employees
GROUP BY department_id;

-- Using CASE with Aggregates: Conditional aggregation.
-- Example: Count employees by gender.
SELECT
    COUNT(CASE WHEN gender = 'Male' THEN 1 END) AS male_count,
    COUNT(CASE WHEN gender = 'Female' THEN 1 END) AS female_count
FROM employees;

/*
============================================
6. Best Practices and Performance Considerations
============================================
- Use indexed columns in WHERE clauses for filtering before aggregation.
- Avoid using aggregate functions on large datasets without GROUP BY to prevent unnecessary computations.
- Use HAVING for filtering aggregated results, not WHERE.
- Optimize queries by using EXPLAIN plans to analyze performance.

Example: Optimize query by filtering rows before aggregation.
*/
SELECT department_id, SUM(salary) AS total_salary
FROM employees
WHERE salary > 3000
GROUP BY department_id;

/*
============================================
7. Compatibility Across SQL Databases
============================================
- LISTAGG: Available in Oracle and SQL Server (with slight variations).
- STRING_AGG: Supported in PostgreSQL.
- GROUP_CONCAT: Available in MySQL.
- MEDIAN: Supported in Oracle, PostgreSQL (requires extensions in some versions).

Ensure to check the database documentation for specific syntax variations.
*/

/*
============================================
8. Common Pitfalls to Avoid
============================================
- Forgetting GROUP BY when using aggregate functions.
- Using aggregate functions on non-numeric columns without proper handling (e.g., COUNT(NULL values)).
- Overloading queries with too many nested aggregates, which can degrade performance.
*/