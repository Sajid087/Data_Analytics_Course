/*
============================================
1. Definition and Basic Concept of Subqueries
============================================
A subquery is a SQL query nested inside another query. It is used to perform operations
that provide results to the main query. Subqueries can be placed in SELECT, FROM,
WHERE, or HAVING clauses.

Syntax:
    SELECT column1, column2
    FROM table1
    WHERE column_name operator (
        SELECT column_name
        FROM table2
        WHERE condition
    );
*/

-- Example: Basic Subquery
SELECT employee_id, employee_name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Sales'
);

/*
============================================
2. Types of Subqueries
============================================
*/

-- Single-row Subquery: Returns a single value.
SELECT first_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- Multiple-row Subquery: Returns multiple values.
SELECT first_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);

-- Multiple-column Subquery: Returns multiple columns.
SELECT first_name, salary
FROM employees
WHERE (department_id, job_id) IN (
    SELECT department_id, job_id
    FROM job_history
    WHERE end_date > '2023-01-01'
);

-- Correlated Subquery: Refers to columns in the outer query.
SELECT e1.first_name, e1.salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department_id = e2.department_id
);

-- Nested Subquery: Contains multiple levels of subqueries.
SELECT first_name
FROM employees
WHERE employee_id IN (
    SELECT manager_id
    FROM employees
    WHERE department_id = (
        SELECT department_id
        FROM departments
        WHERE department_name = 'IT'
    )
);

/*
============================================
3. Execution Flow of Subqueries
============================================
Subqueries execute from the innermost query to the outermost query.
Results from the inner query are passed to the outer query for processing.
*/

/*
============================================
4. Special Operators Used with Subqueries
============================================
- IN / NOT IN: Match values in a list.
- ANY / ALL: Compare values against a list.
- EXISTS / NOT EXISTS: Check for the existence of rows.
*/

-- Example: IN Operator
SELECT first_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);

-- Example: EXISTS Operator
SELECT first_name, last_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE e.department_id = d.department_id
    AND d.department_name = 'HR'
);

/*
============================================
5. Comparison Between Subqueries and Joins
============================================
- Subqueries are easier to read for simple queries but may have performance issues.
- Joins are generally faster for large datasets as they leverage indexes efficiently.
*/

-- Subquery Example
SELECT first_name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Finance'
);

-- Join Example
SELECT e.first_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

/*
============================================
6. Performance Considerations and Best Practices
============================================
- Use EXISTS for better performance over IN when working with large datasets.
- Avoid correlated subqueries if possible; use JOINs instead.
- Use indexes on columns used in subqueries.
- Limit the number of rows returned by subqueries for efficiency.
*/

/*
============================================
7. Real-world Examples for Each Type of Subquery
============================================
*/

-- Example: Finding employees with above-average salaries in their department
SELECT first_name, salary, department_id
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department_id = e2.department_id
);

-- Example: Using subquery in the FROM clause (Inline view)
SELECT department_name, avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) avg_salaries
JOIN departments d
ON avg_salaries.department_id = d.department_id
WHERE avg_salary > 5000;

/*
============================================
8. Common Use Cases and Scenarios
============================================
- Filtering results based on aggregate data.
- Checking for the existence of related data.
- Creating inline views for complex calculations.
- Validating data consistency across related tables.
*/

/*
============================================
9. Error Handling and Troubleshooting Tips
============================================
- Ensure subqueries return the correct number of rows for the context (single-row vs. multi-row).
- Use aliases to avoid ambiguous column references.
- Test subqueries independently before integrating into the main query.
*/

/*
============================================
10. Syntax Patterns and Formatting Guidelines
============================================
- Use proper indentation to enhance readability.
- Alias subqueries for clarity in complex queries.
- Comment your queries to explain the purpose and logic.
*/