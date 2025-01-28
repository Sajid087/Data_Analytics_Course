/*
Definition:
-----------
The WHILE LOOP in PL/SQL is a control structure used to repeatedly execute a block of code 
as long as a specified condition evaluates to TRUE.

Key Features:
-------------
1. The condition is evaluated at the start of each iteration.
2. If the condition evaluates to FALSE, the loop terminates.
3. Suitable for situations where the number of iterations is not predefined.
*/

-- ==========================================================
-- Basic Syntax and Structure of WHILE LOOP
-- ==========================================================
/*
Syntax:
-------
WHILE <condition> LOOP
    <statements>;
END LOOP;

1. <condition>: Any valid boolean expression.
2. <statements>: The block of code to be executed repeatedly.
*/

-- Example 1: Basic Counter WHILE LOOP
DECLARE
    counter NUMBER := 1;
BEGIN
    WHILE counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteration: ' || counter); -- Display current iteration
        counter := counter + 1; -- Increment the counter
    END LOOP;
END;
/

-- ==========================================================
-- Difference Between WHILE LOOP and Other Loops
-- ==========================================================
/*
1. WHILE LOOP:
   - Evaluates the condition before executing the loop body.
   - Use when the number of iterations is unknown.

2. FOR LOOP:
   - Iterates over a fixed range of values.
   - Use when the number of iterations is predefined.

3. LOOP (Basic):
   - Executes the loop body at least once before evaluating the EXIT condition.
   - Use when at least one iteration is guaranteed.
*/

-- ==========================================================
-- WHILE LOOP with Database Operations
-- ==========================================================
/*
Use Case:
---------
Iterate through a database table and process records meeting specific conditions.
*/
DECLARE
    employee_name employees.first_name%TYPE;
    salary employees.salary%TYPE;
    min_salary NUMBER := 5000;
BEGIN
    WHILE min_salary <= 10000 LOOP
        SELECT first_name, salary
        INTO employee_name, salary
        FROM employees
        WHERE salary = min_salary AND ROWNUM = 1;

        DBMS_OUTPUT.PUT_LINE('Employee: ' || employee_name || ' | Salary: ' || salary);

        min_salary := min_salary + 1000; -- Increment the salary threshold
    END LOOP;
END;
/

-- ==========================================================
-- Nested WHILE LOOP Example
-- ==========================================================
/*
Use Case:
---------
Generate a multiplication table using nested WHILE loops.
*/
DECLARE
    i NUMBER := 1;
    j NUMBER;
BEGIN
    WHILE i <= 5 LOOP
        j := 1;
        WHILE j <= 5 LOOP
            DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || (i * j));
            j := j + 1;
        END LOOP;
        i := i + 1;
    END LOOP;
END;
/

-- ==========================================================
-- WHILE LOOP with Exception Handling
-- ==========================================================
/*
Use Case:
---------
Handle errors that occur within a WHILE loop.
*/
DECLARE
    counter NUMBER := 1;
BEGIN
    WHILE counter <= 5 LOOP
        BEGIN
            IF counter = 3 THEN
                RAISE_APPLICATION_ERROR(-20001, 'Simulated error on iteration 3');
            END IF;
            DBMS_OUTPUT.PUT_LINE('Processing iteration: ' || counter);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error occurred on iteration: ' || counter);
        END;
        counter := counter + 1;
    END LOOP;
END;
/

-- ==========================================================
-- WHILE LOOP with Complex Termination Conditions
-- ==========================================================
/*
Use Case:
---------
Exit the loop based on a combination of conditions.
*/
DECLARE
    total_sales NUMBER := 0;
    sales_target NUMBER := 10000;
    daily_sales NUMBER;
BEGIN
    WHILE total_sales < sales_target LOOP
        daily_sales := TRUNC(DBMS_RANDOM.VALUE(500, 1500)); -- Simulate daily sales
        total_sales := total_sales + daily_sales;

        DBMS_OUTPUT.PUT_LINE('Daily Sales: ' || daily_sales || ' | Total Sales: ' || total_sales);

        IF total_sales >= sales_target THEN
            DBMS_OUTPUT.PUT_LINE('Sales target achieved!');
            EXIT; -- Exit the loop when the target is met
        END IF;
    END LOOP;
END;
/

-- ==========================================================
-- Tips for Using WHILE Loops Effectively
-- ==========================================================
/*
1. Always ensure the termination condition is met to avoid infinite loops.
2. Use EXIT or EXIT WHEN statements to handle specific termination scenarios.
3. Keep loop logic simple and clear.
4. Avoid heavy computational tasks inside loops to maintain performance.
5. Use DBMS_OUTPUT.PUT_LINE for debugging during development.
*/