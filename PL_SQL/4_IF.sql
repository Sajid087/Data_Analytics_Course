/*============================================================
1. Basic Syntax and Structure of IF Statements
============================================================*/
-- Syntax for IF-THEN
IF condition THEN
    -- statements to execute if the condition is TRUE
END IF;

-- Syntax for IF-THEN-ELSE
IF condition THEN
    -- statements to execute if the condition is TRUE
ELSE
    -- statements to execute if the condition is FALSE
END IF;

-- Syntax for IF-THEN-ELSIF
IF condition1 THEN
    -- statements to execute if condition1 is TRUE
ELSIF condition2 THEN
    -- statements to execute if condition2 is TRUE
ELSE
    -- statements to execute if none of the conditions are TRUE
END IF;

/*============================================================
2. Example 1: IF-THEN
============================================================*/
DECLARE
    v_salary NUMBER := 5000;
BEGIN
    IF v_salary > 4000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary exceeds 4000.');
    END IF;
END;
/

/*============================================================
3. Example 2: IF-THEN-ELSE
============================================================*/
DECLARE
    v_salary NUMBER := 3500;
BEGIN
    IF v_salary > 4000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary exceeds 4000.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary does not exceed 4000.');
    END IF;
END;
/

/*============================================================
4. Example 3: IF-THEN-ELSIF
============================================================*/
DECLARE
    v_salary NUMBER := 3000;
BEGIN
    IF v_salary > 4000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary exceeds 4000.');
    ELSIF v_salary BETWEEN 3000 AND 4000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary is between 3000 and 4000.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary is less than 3000.');
    END IF;
END;
/

/*============================================================
5. Nested IF Statements
============================================================*/
DECLARE
    v_salary NUMBER := 3000;
    v_bonus NUMBER := 500;
BEGIN
    IF v_salary > 3000 THEN
        IF v_bonus > 500 THEN
            DBMS_OUTPUT.PUT_LINE('High salary and high bonus.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('High salary but low bonus.');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary is not high.');
    END IF;
END;
/

/*============================================================
6. Comparison with CASE Statements
============================================================*/
-- IF-THEN example
DECLARE
    v_grade CHAR(1) := 'A';
BEGIN
    IF v_grade = 'A' THEN
        DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF v_grade = 'B' THEN
        DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Needs Improvement');
    END IF;
END;
/

-- Equivalent CASE example
DECLARE
    v_grade CHAR(1) := 'A';
BEGIN
    CASE v_grade
        WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE DBMS_OUTPUT.PUT_LINE('Needs Improvement');
    END CASE;
END;
/

/*============================================================
7. Performance Considerations
============================================================*/
-- Use IF statements for simple, straightforward conditions.
-- For multiple mutually exclusive conditions, consider CASE statements for better readability and possibly better performance.

/*============================================================
8. Common Pitfalls to Avoid
============================================================*/
-- 1. Forgetting to handle NULL conditions:
DECLARE
    v_value NUMBER := NULL;
BEGIN
    IF v_value = 10 THEN
        DBMS_OUTPUT.PUT_LINE('Value is 10.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Value is not 10 or is NULL.');
    END IF;
END;
/
-- Explanation: NULL values require explicit handling in conditions.

/*============================================================
9. Error Handling Within IF Statements
============================================================*/
DECLARE
    v_dividend NUMBER := 10;
    v_divisor NUMBER := 0;
BEGIN
    IF v_divisor = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: ' || v_dividend / v_divisor);
    END IF;
END;
/

/*============================================================
10. Tips for Optimizing IF Statements
============================================================*/
-- 1. Use boolean variables for complex conditions to improve readability.
-- 2. Avoid deeply nested IF statements; refactor into separate blocks or use CASE statements.
-- 3. Always include an ELSE clause to handle unexpected conditions.