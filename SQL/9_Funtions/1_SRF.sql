/*
============================================
1. Introduction to Single Row Functions
============================================
Single row functions operate on individual rows and return a single result for each row.
They can be categorized into:
- Character/String Functions
- Numeric Functions
- Date Functions
- Conversion Functions
- General Functions
Single row functions are deterministic (return the same result for the same input) and play a vital role in data transformation and formatting.
*/

-- Creating a sample table for demonstration
CREATE TABLE sample_data (
    id NUMBER,
    name VARCHAR2(50),
    salary NUMBER,
    hire_date DATE
);

INSERT INTO sample_data VALUES (1, 'John Doe', 45000, TO_DATE('2020-01-15', 'YYYY-MM-DD'));
INSERT INTO sample_data VALUES (2, 'Jane Smith', 52000, TO_DATE('2018-03-22', 'YYYY-MM-DD'));
INSERT INTO sample_data VALUES (3, 'Michael Brown', NULL, TO_DATE('2019-06-10', 'YYYY-MM-DD'));
COMMIT;

/*
============================================
2. Character/String Functions
============================================
*/

-- LOWER: Converts a string to lowercase
SELECT LOWER(name) AS lower_name FROM sample_data;

-- UPPER: Converts a string to uppercase
SELECT UPPER(name) AS upper_name FROM sample_data;

-- INITCAP: Converts the first letter of each word to uppercase
SELECT INITCAP(name) AS initcap_name FROM sample_data;

-- CONCAT: Concatenates two strings
SELECT CONCAT(name, ' - Employee') AS full_description FROM sample_data;

-- SUBSTR: Extracts a substring from a string
SELECT SUBSTR(name, 1, 4) AS substring FROM sample_data;

-- LENGTH: Returns the length of a string
SELECT LENGTH(name) AS name_length FROM sample_data;

-- TRIM: Removes leading and trailing characters
SELECT TRIM(' J ' FROM ' John ') AS trimmed_name FROM dual;

-- LTRIM: Removes leading characters
SELECT LTRIM('000123', '0') AS left_trimmed FROM dual;

-- RTRIM: Removes trailing characters
SELECT RTRIM('123000', '0') AS right_trimmed FROM dual;

-- REPLACE: Replaces occurrences of a substring with another
SELECT REPLACE(name, 'Smith', 'Johnson') AS replaced_name FROM sample_data;

-- LPAD: Pads the left side of a string
SELECT LPAD(name, 10, '*') AS left_padded FROM sample_data;

-- RPAD: Pads the right side of a string
SELECT RPAD(name, 10, '*') AS right_padded FROM sample_data;

-- INSTR: Returns the position of a substring
SELECT INSTR(name, 'a') AS position_of_a FROM sample_data;

/*
============================================
3. Numeric Functions
============================================
*/

-- ROUND: Rounds a number to a specified number of decimal places
SELECT ROUND(salary, -3) AS rounded_salary FROM sample_data;

-- TRUNC: Truncates a number to a specified number of decimal places
SELECT TRUNC(salary, -3) AS truncated_salary FROM sample_data;

-- MOD: Returns the remainder of a division
SELECT MOD(salary, 5000) AS remainder FROM sample_data;

-- ABS: Returns the absolute value of a number
SELECT ABS(-45000) AS absolute_value FROM dual;

-- CEIL: Rounds a number up to the nearest integer
SELECT CEIL(45.23) AS ceil_value FROM dual;

-- FLOOR: Rounds a number down to the nearest integer
SELECT FLOOR(45.23) AS floor_value FROM dual;

-- POWER: Raises a number to a specified power
SELECT POWER(2, 3) AS power_value FROM dual;

-- SQRT: Returns the square root of a number
SELECT SQRT(16) AS square_root FROM dual;

-- SIGN: Returns the sign of a number (-1, 0, 1)
SELECT SIGN(-45000) AS sign_value FROM dual;

/*
============================================
4. Date Functions
============================================
*/

-- SYSDATE: Returns the current date and time
SELECT SYSDATE AS current_date FROM dual;

-- ADD_MONTHS: Adds a specified number of months to a date
SELECT ADD_MONTHS(hire_date, 6) AS six_months_later FROM sample_data;

-- MONTHS_BETWEEN: Returns the number of months between two dates
SELECT MONTHS_BETWEEN(SYSDATE, hire_date) AS months_difference FROM sample_data;

-- NEXT_DAY: Returns the next occurrence of a specific day of the week
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') AS next_friday FROM dual;

-- LAST_DAY: Returns the last day of the month
SELECT LAST_DAY(SYSDATE) AS end_of_month FROM dual;

-- ROUND: Rounds a date to the nearest day, month, etc.
SELECT ROUND(hire_date, 'MONTH') AS rounded_date FROM sample_data;

-- TRUNC: Truncates a date to a specific format
SELECT TRUNC(hire_date, 'YEAR') AS start_of_year FROM sample_data;

/*
============================================
5. Conversion Functions
============================================
*/

-- TO_CHAR: Converts a number or date to a string
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS formatted_date FROM dual;

-- TO_NUMBER: Converts a string to a number
SELECT TO_NUMBER('12345') AS number_value FROM dual;

-- TO_DATE: Converts a string to a date
SELECT TO_DATE('2023-01-01', 'YYYY-MM-DD') AS date_value FROM dual;

-- CAST: Converts a value to a specified data type
SELECT CAST('123.45' AS NUMBER) AS cast_value FROM dual;

/*
============================================
6. General Functions
============================================
*/

-- NVL: Replaces NULL with a specified value
SELECT NVL(salary, 0) AS salary_with_default FROM sample_data;

-- NVL2: Returns different values depending on whether an expression is NULL or not
SELECT NVL2(salary, 'Has Salary', 'No Salary') AS salary_status FROM sample_data;

-- NULLIF: Returns NULL if two expressions are equal
SELECT NULLIF(salary, 45000) AS null_if_match FROM sample_data;

-- COALESCE: Returns the first non-NULL value in a list
SELECT COALESCE(NULL, NULL, salary, 10000) AS first_non_null FROM sample_data;

-- CASE: Provides conditional logic
SELECT CASE 
           WHEN salary > 50000 THEN 'High Salary'
           WHEN salary > 30000 THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS salary_category
FROM sample_data;

-- DECODE: Similar to CASE but specific to Oracle
SELECT DECODE(salary, NULL, 'No Salary', 45000, 'Average Salary', 'Other') AS salary_decoded
FROM sample_data;

/*
============================================
7. Conclusion
============================================
Single row functions are powerful tools for transforming and analyzing data in SQL. 
By mastering these functions, you can efficiently handle complex queries and enhance data retrieval.
*/