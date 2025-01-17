/*
============================================
1. Comparison Operators
============================================
Comparison operators are used to compare two expressions and return a boolean value.
- Operators: =, <>, >, <, >=, <=
*/

-- Syntax and Examples
-- Example: Equal to (=)
SELECT * FROM employees WHERE department = 'Sales';

-- Example: Not equal to (<>)
SELECT * FROM employees WHERE salary <> 50000;

-- Example: Greater than (>)
SELECT * FROM employees WHERE salary > 60000;

-- Example: Less than (<)
SELECT * FROM employees WHERE salary < 40000;

-- Example: Greater than or equal to (>=)
SELECT * FROM employees WHERE hire_date >= '2020-01-01';

-- Example: Less than or equal to (<=)
SELECT * FROM employees WHERE hire_date <= '2019-12-31';

/*
Best Practices:
- Ensure data types match between columns and constants in comparisons.
- Use indexed columns for better performance.

Common Pitfalls:
- Misinterpreting NULL comparisons (e.g., NULL = NULL is false).
*/

/*
============================================
2. Logical Operators
============================================
Logical operators combine multiple conditions in the WHERE clause.
- Operators: AND, OR, NOT
*/

-- Syntax and Examples
-- Example: AND
SELECT * FROM employees WHERE department = 'IT' AND salary > 60000;

-- Example: OR
SELECT * FROM employees WHERE department = 'HR' OR department = 'Finance';

-- Example: NOT
SELECT * FROM employees WHERE NOT department = 'Sales';

/*
Best Practices:
- Use parentheses to clarify precedence in complex conditions.

Common Pitfalls:
- Logical conditions can slow performance without proper indexing.
*/

/*
============================================
3. Pattern Matching Operators
============================================
Pattern matching operators match values based on specific patterns.
- Operators: LIKE, NOT LIKE, BETWEEN, IN
*/

-- Syntax and Examples
-- Example: LIKE
SELECT * FROM employees WHERE first_name LIKE 'A%';

-- Example: NOT LIKE
SELECT * FROM employees WHERE first_name NOT LIKE 'J%';

-- Example: BETWEEN
SELECT * FROM employees WHERE salary BETWEEN 40000 AND 60000;

-- Example: IN
SELECT * FROM employees WHERE department IN ('Sales', 'IT', 'HR');

/*
Best Practices:
- Use % and _ sparingly in LIKE patterns for better performance.
- IN is more efficient than multiple OR conditions.

Common Pitfalls:
- Using NOT LIKE with wide patterns can scan the entire table.
*/

/*
============================================
4. NULL Operators
============================================
NULL operators check for NULL or non-NULL values.
- Operators: IS NULL, IS NOT NULL
*/

-- Syntax and Examples
-- Example: IS NULL
SELECT * FROM employees WHERE bonus IS NULL;

-- Example: IS NOT NULL
SELECT * FROM employees WHERE bonus IS NOT NULL;

/*
Best Practices:
- Always handle NULL explicitly in queries.

Common Pitfalls:
- Assuming NULL comparisons behave like other values.
*/

/*
============================================
5. Arithmetic Operators
============================================
Arithmetic operators perform calculations on numerical values.
- Operators: +, -, *, /, %
*/

-- Syntax and Examples
-- Example: Addition (+)
SELECT first_name, salary + 5000 AS new_salary FROM employees;

-- Example: Subtraction (-)
SELECT first_name, salary - 2000 AS adjusted_salary FROM employees;

-- Example: Multiplication (*)
SELECT first_name, salary * 1.1 AS increased_salary FROM employees;

-- Example: Division (/)
SELECT first_name, salary / 12 AS monthly_salary FROM employees;

-- Example: Modulus (%)
SELECT first_name, salary % 1000 AS remainder FROM employees;

/*
Best Practices:
- Avoid division by zero errors.

Common Pitfalls:
- Arithmetic operations on NULL result in NULL.
*/

/*
============================================
6. Special Operators
============================================
Special operators provide advanced querying capabilities.
- Operators: EXISTS, ANY, ALL
*/

-- Syntax and Examples
-- Example: EXISTS
SELECT * FROM employees WHERE EXISTS (SELECT 1 FROM departments WHERE departments.manager_id = employees.employee_id);

-- Example: ANY
SELECT * FROM employees WHERE salary > ANY (SELECT salary FROM employees WHERE department = 'IT');

-- Example: ALL
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department = 'HR');

/*
Best Practices:
- Use EXISTS for correlated subqueries efficiently.
- Understand the behavior of ANY and ALL with empty result sets.

Common Pitfalls:
- Misusing EXISTS with non-correlated subqueries.
*/

/*
============================================
General Tips for WHERE Clause Optimization
============================================
- Use indexed columns in WHERE conditions.
- Avoid using functions on columns in WHERE clauses.
- Analyze query plans to identify bottlenecks.
- Write concise and clear conditions.
*/