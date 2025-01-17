/*
============================================
1. What is DQL and its Role in SQL
============================================
Data Query Language (DQL) is a subset of SQL that focuses on retrieving data from a database.
Its main command is SELECT, which allows users to fetch and display data based on specific criteria.
DQL helps query and analyze data, making it a crucial component for data manipulation and reporting.
*/

/*
============================================
2. The HAVING Clause: Purpose and Functionality
============================================
The HAVING clause is used to filter the results of a GROUP BY operation based on aggregate function conditions.
While the WHERE clause filters rows before grouping, HAVING filters groups after aggregation.

Syntax:
SELECT column1, AGG_FUNC(column2)
FROM table_name
GROUP BY column1
HAVING AGG_FUNC(column2) condition;
*/

-- Example: Basic HAVING Clause
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 50000;

/*
============================================
3. Key Differences Between WHERE and HAVING Clauses
============================================
- WHERE filters rows before any grouping or aggregation occurs.
- HAVING filters aggregated data after the GROUP BY clause is applied.

Example:
WHERE: Filters individual rows (e.g., salary > 5000).
HAVING: Filters aggregated results (e.g., total_salary > 50000).
*/

-- Example: WHERE vs. HAVING
SELECT department, SUM(salary) AS total_salary
FROM employees
WHERE salary > 5000  -- Filters individual rows first
GROUP BY department
HAVING total_salary > 50000; -- Filters aggregated results

/*
============================================
4. Practical Examples of HAVING Clause Usage with GROUP BY
============================================
*/

-- Example: Using COUNT with HAVING
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING employee_count > 10;

-- Example: Using AVG with HAVING
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING average_salary > 6000;

-- Example: Using Multiple Conditions in HAVING
SELECT department, SUM(salary) AS total_salary, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING total_salary > 50000 AND average_salary > 7000;

/*
============================================
5. Common Scenarios Where HAVING is Essential
============================================
- Filtering groups based on aggregate values (e.g., total sales above a threshold).
- Creating advanced reports with grouped data.
- Applying complex conditions to aggregated data.
*/

/*
============================================
6. Best Practices and Optimization Tips
============================================
- Minimize the use of HAVING by filtering rows with WHERE whenever possible.
- Use indexed columns in the WHERE clause for better performance.
- Avoid overly complex HAVING conditions, as they can degrade query performance.
*/

/*
============================================
7. Common Mistakes to Avoid When Using HAVING
============================================
- Using HAVING without GROUP BY when aggregation isn’t necessary.
- Confusing WHERE with HAVING, leading to incorrect query results.
- Applying HAVING conditions to non-aggregated columns.
*/

-- Incorrect Example: HAVING Without Aggregation
-- SELECT department
-- FROM employees
-- HAVING department = 'Sales';
-- Solution: Use WHERE instead.

-- Correct Example:
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 50000;

/*
============================================
8. Syntax Variations and Supported Operators
============================================
HAVING supports all comparison operators (=, >, <, >=, <=, <>) and logical operators (AND, OR, NOT).
It can also use special operators like IN, BETWEEN, and LIKE with aggregated results.
*/

-- Example: Using IN with HAVING
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING department IN ('Sales', 'Marketing');

-- Example: Using BETWEEN with HAVING
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary BETWEEN 40000 AND 80000;

/*
============================================
9. Performance Considerations
============================================
- Ensure efficient indexing to improve WHERE clause filtering before GROUP BY.
- Optimize aggregate functions by pre-aggregating data where applicable.
- Use EXPLAIN plans to analyze and fine-tune query performance.
*/

-- Optimized Example
CREATE INDEX idx_department ON employees(department);
SELECT department, SUM(salary) AS total_salary
FROM employees
WHERE salary > 5000
GROUP BY department
HAVING total_salary > 50000;