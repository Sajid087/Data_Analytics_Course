/*
============================================
1. What is Data Query Language (DQL)?
============================================
DQL is a subset of SQL commands used to query and retrieve data from databases.
The SELECT statement is the primary command in DQL, allowing users to specify the data they want to fetch.

Key purposes of DQL:
- Retrieve data from one or more tables.
- Apply filters, grouping, and sorting.
- Perform calculations and format the output.
*/

/*
============================================
2. The SELECT Statement
============================================
The SELECT statement is used to specify which columns of data to retrieve from a table.
Syntax:
SELECT column1, column2, ...
FROM table_name;
*/

-- Example: Fetch all columns from the "employees" table
SELECT * FROM employees;

-- Example: Fetch specific columns (e.g., first_name and last_name) from the "employees" table
SELECT first_name, last_name FROM employees;

/*
============================================
3. Column Selection and Projection Techniques
============================================
Projection refers to the act of selecting specific columns in a query to control the output structure.
*/

-- Example: Retrieve only the "department" and "salary" columns
SELECT department, salary FROM employees;

/*
============================================
4. Using Aliases for Columns and Tables
============================================
Aliases are used to rename columns or tables in the result set for better readability.

Syntax:
SELECT column_name AS alias_name
FROM table_name AS alias_name;
*/

-- Example: Rename "first_name" to "First Name" and "last_name" to "Last Name"
SELECT first_name AS "First Name", last_name AS "Last Name" FROM employees;

-- Example: Alias a table for shorter references
SELECT e.first_name, e.last_name
FROM employees AS e;

/*
============================================
5. Working with Expressions in Projections
============================================
Expressions can be used to perform calculations or combine values in the SELECT statement.
*/

-- Example: Calculate the annual salary based on a "monthly_salary" column
SELECT first_name, last_name, (monthly_salary * 12) AS annual_salary FROM employees;

/*
============================================
6. Handling NULL Values in Projections
============================================
Use functions like COALESCE or IFNULL to handle NULL values in query results.
*/

-- Example: Replace NULL values in the "bonus" column with 0
SELECT first_name, last_name, COALESCE(bonus, 0) AS bonus_amount FROM employees;

/*
============================================
7. Using DISTINCT for Unique Values
============================================
The DISTINCT keyword ensures that duplicate rows are removed from the result set.
*/

-- Example: Retrieve unique department names
SELECT DISTINCT department FROM employees;

/*
============================================
8. Implementing Calculated Fields
============================================
Calculated fields allow for the creation of new columns based on existing data.
*/

-- Example: Add a column showing 10% of the salary as a bonus
SELECT first_name, last_name, salary, (salary * 0.10) AS bonus FROM employees;

/*
============================================
9. String Concatenation in Projections
============================================
Concatenate strings to combine column values into a single result.
*/

-- Example: Combine first name and last name into a full name
SELECT first_name || ' ' || last_name AS full_name FROM employees;

-- Note: Use CONCAT() in databases like MySQL
-- SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

/*
============================================
10. Using Built-In Functions in Projections
============================================
SQL provides various built-in functions for numeric, string, and date operations.
*/

-- Example: Numeric function to round off salaries
SELECT first_name, last_name, ROUND(salary, 2) AS rounded_salary FROM employees;

-- Example: String function to convert names to uppercase
SELECT UPPER(first_name) AS first_name_uppercase FROM employees;

-- Example: Date function to extract the year from a "hire_date" column
SELECT first_name, EXTRACT(YEAR FROM hire_date) AS hire_year FROM employees;

/*
============================================
11. Best Practices and Common Pitfalls
============================================
Best Practices:
- Always specify column names instead of using SELECT * for better performance and readability.
- Use aliases to make output columns understandable.
- Handle NULL values to avoid unexpected results.
- Use DISTINCT carefully as it may impact performance on large datasets.

Common Pitfalls:
- Forgetting to handle NULL values in calculations.
- Using SELECT * in production queries, which can fetch unnecessary data.
- Ignoring performance implications of complex expressions and functions.
*/