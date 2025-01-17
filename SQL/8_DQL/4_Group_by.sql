/*
============================================
1. What is DQL and its Role in SQL
============================================
Data Query Language (DQL) is a subset of SQL used for retrieving data from a database.
The primary DQL command is SELECT, which allows querying and projection of data.
The GROUP BY clause is a powerful feature of DQL that organizes rows into groups based on specified columns.
*/

/*
============================================
2. The GROUP BY Clause: Syntax, Purpose, and Functionality
============================================
The GROUP BY clause groups rows sharing a property into summary rows, often used with aggregate functions.

Syntax:
SELECT column1, column2, AGG_FUNC(column3)
FROM table_name
GROUP BY column1, column2;

Purpose:
- To aggregate data based on unique values in one or more columns.
- To generate summary reports.
*/

-- Example: Basic GROUP BY
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

/*
============================================
3. Common Use Cases and Scenarios for GROUP BY
============================================
- Counting the number of rows in each group.
- Calculating total, average, maximum, or minimum values per group.
- Generating reports that require data aggregation (e.g., sales reports by region).
*/

-- Example: GROUP BY with SUM
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Example: GROUP BY with AVG
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

/*
============================================
4. Best Practices for Using GROUP BY
============================================
- Ensure that all non-aggregate columns in the SELECT statement are included in the GROUP BY clause.
- Use indexed columns for grouping to improve performance.
- Avoid grouping by too many columns, as it can degrade performance.
*/

/*
============================================
5. Examples of GROUP BY with Aggregate Functions
============================================
- COUNT: Counts the number of rows in each group.
- SUM: Calculates the total value of a numeric column for each group.
- AVG: Calculates the average value of a numeric column for each group.
- MAX: Retrieves the maximum value in each group.
- MIN: Retrieves the minimum value in each group.
*/

-- Example: GROUP BY with MAX and MIN
SELECT department, MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;

/*
============================================
6. Common Pitfalls and How to Avoid Them
============================================
- Forgetting to include non-aggregated columns in the GROUP BY clause.
- Using GROUP BY on columns with high cardinality, leading to poor performance.
- Misunderstanding the interaction between GROUP BY and non-aggregated columns in SELECT.
*/

-- Example of a Pitfall: Including non-aggregated columns without GROUP BY
-- Incorrect:
-- SELECT department, employee_name, MAX(salary) FROM employees GROUP BY department;
-- Solution: Remove non-aggregated column or revise the query logic.

/*
============================================
7. The Relationship Between GROUP BY and HAVING Clause
============================================
The HAVING clause is used to filter groups created by the GROUP BY clause.
Unlike WHERE, HAVING works on aggregated data.

Syntax:
SELECT column1, AGG_FUNC(column2)
FROM table_name
GROUP BY column1
HAVING AGG_FUNC(column2) condition;
*/

-- Example: GROUP BY with HAVING
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 100000;

/*
============================================
8. Performance Considerations
============================================
- Use indexed columns for grouping to enhance query performance.
- Limit the number of columns in GROUP BY to minimize computational overhead.
- Analyze query execution plans to identify bottlenecks.
- Consider pre-aggregating data in intermediate tables for frequently used groupings.
*/

-- Example: Optimized GROUP BY
CREATE INDEX idx_department ON employees(department);
SELECT department, COUNT(*)
FROM employees
GROUP BY department;