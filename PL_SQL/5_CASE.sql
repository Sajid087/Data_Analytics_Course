-- =============================================================
-- Definition and Purpose of CASE
-- =============================================================
/*
   CASE is a control structure in PL/SQL that allows conditional logic 
   for evaluating and returning values. It operates in two forms:
   1. Simple CASE: Compares a single expression to multiple values.
   2. Searched CASE: Evaluates multiple Boolean expressions.
*/

-- =============================================================
-- Basic Syntax of Simple CASE
-- =============================================================
/*
   Syntax:
   CASE expression
       WHEN value1 THEN result1
       WHEN value2 THEN result2
       ...
       ELSE default_result
   END;

   - "expression" is evaluated once and compared against each WHEN value.
   - "ELSE" is optional but recommended for handling unmatched cases.
*/
DECLARE
    v_grade CHAR(1) := 'B';
    v_result VARCHAR2(20);
BEGIN
    v_result := CASE v_grade
                   WHEN 'A' THEN 'Excellent'
                   WHEN 'B' THEN 'Good'
                   WHEN 'C' THEN 'Average'
                   ELSE 'Poor'
                END;
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/

-- =============================================================
-- Basic Syntax of Searched CASE
-- =============================================================
/*
   Syntax:
   CASE
       WHEN condition1 THEN result1
       WHEN condition2 THEN result2
       ...
       ELSE default_result
   END;

   - Each "condition" is a Boolean expression.
   - Evaluates conditions sequentially until one is TRUE.
*/
DECLARE
    v_salary NUMBER := 4500;
    v_category VARCHAR2(20);
BEGIN
    v_category := CASE
                      WHEN v_salary > 5000 THEN 'High Income'
                      WHEN v_salary BETWEEN 3000 AND 5000 THEN 'Middle Income'
                      ELSE 'Low Income'
                  END;
    DBMS_OUTPUT.PUT_LINE('Income Category: ' || v_category);
END;
/

-- =============================================================
-- Using CASE in SELECT Statements
-- =============================================================
/*
   CASE can also be used directly in SQL SELECT queries for data transformation.
*/
SELECT employee_id,
       salary,
       CASE 
           WHEN salary > 10000 THEN 'High'
           WHEN salary BETWEEN 5000 AND 10000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;

-- =============================================================
-- Nested CASE Statements
-- =============================================================
/*
   CASE statements can be nested to handle complex logic.
*/
DECLARE
    v_grade CHAR(1) := 'C';
    v_result VARCHAR2(20);
BEGIN
    v_result := CASE v_grade
                   WHEN 'A' THEN 'Excellent'
                   WHEN 'B' THEN 'Good'
                   WHEN 'C' THEN CASE 
                                     WHEN 1=1 THEN 'Just Passed'
                                     ELSE 'Average'
                                 END
                   ELSE 'Poor'
                END;
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/

-- =============================================================
-- Comparison: CASE vs IF-THEN-ELSE
-- =============================================================
/*
   - IF-THEN-ELSE provides more flexibility but requires repetitive coding.
   - CASE is more concise and readable, especially for value-based comparisons.
*/
DECLARE
    v_score NUMBER := 85;
    v_result VARCHAR2(20);
BEGIN
    -- Using IF-THEN-ELSE
    IF v_score >= 90 THEN
        v_result := 'Excellent';
    ELSIF v_score >= 75 THEN
        v_result := 'Good';
    ELSE
        v_result := 'Needs Improvement';
    END IF;

    -- Using CASE
    v_result := CASE
                   WHEN v_score >= 90 THEN 'Excellent'
                   WHEN v_score >= 75 THEN 'Good'
                   ELSE 'Needs Improvement'
                END;

    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/

-- =============================================================
-- Common Pitfalls and Best Practices
-- =============================================================
/*
   Common Pitfalls:
   - Forgetting the ELSE clause (leads to NULL if no match is found).
   - Overusing CASE in SELECT queries, leading to reduced readability.
   
   Best Practices:
   - Always include an ELSE clause for safety.
   - Use meaningful names for result variables and conditions.
   - Avoid deep nesting for better readability; consider splitting logic.
*/

-- =============================================================
-- Performance Considerations and Optimization Tips
-- =============================================================
/*
   - CASE evaluates conditions sequentially; order conditions by likelihood.
   - For complex queries, consider moving logic to a stored procedure.
   - Index columns used in CASE conditions to improve performance.
*/

-- Example: Ordering conditions by likelihood
SELECT product_id,
       CASE
           WHEN stock > 100 THEN 'In Stock'
           WHEN stock > 0 THEN 'Low Stock'
           ELSE 'Out of Stock'
       END AS stock_status
FROM products;

-- =============================================================
-- Error Handling in CASE Statements
-- =============================================================
/*
   Use CASE with NVL or COALESCE to handle NULL values.
*/
DECLARE
    v_input NUMBER := NULL;
    v_output VARCHAR2(20);
BEGIN
    v_output := CASE
                   WHEN NVL(v_input, 0) = 0 THEN 'No Input'
                   ELSE 'Input Provided'
                END;
    DBMS_OUTPUT.PUT_LINE('Output: ' || v_output);
END;
/