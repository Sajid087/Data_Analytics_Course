/*
Definition:
- A FOR LOOP is a control structure in PL/SQL that repeatedly executes a block of code for a specific number of iterations.
- It is used for iterating over a range of numbers or rows returned by a cursor.
*/

/*
Syntax:
Numeric FOR LOOP:
FOR loop_variable IN [REVERSE] lower_bound..upper_bound LOOP
    -- Code to execute
END LOOP;

Cursor FOR LOOP:
FOR record_variable IN cursor_name LOOP
    -- Code to execute
END LOOP;
*/

/*
====================================
        Advantages of FOR LOOP
====================================
- Simplifies iteration logic by automatically incrementing/decrementing the loop variable.
- Eliminates the need for explicit control of loop variables.
- Prevents common pitfalls like infinite loops.
*/

/*
====================================
      Section 1: Numeric FOR LOOP
====================================
*/

-- Example 1: Basic Numeric FOR LOOP
DECLARE
    v_sum NUMBER := 0;
BEGIN
    FOR i IN 1..5 LOOP
        v_sum := v_sum + i;
        DBMS_OUTPUT.PUT_LINE('Iteration: ' || i || ' | Sum: ' || v_sum);
    END LOOP;
END;
/

-- Example 2: REVERSE Numeric FOR LOOP
DECLARE
    v_product NUMBER := 1;
BEGIN
    FOR i IN REVERSE 1..5 LOOP
        v_product := v_product * i;
        DBMS_OUTPUT.PUT_LINE('Iteration: ' || i || ' | Product: ' || v_product);
    END LOOP;
END;
/

/*
====================================
        Section 2: Nested FOR LOOP
====================================
*/

-- Example 3: Nested Numeric FOR LOOP
DECLARE
    v_result VARCHAR2(50);
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..3 LOOP
            v_result := 'Outer: ' || i || ' | Inner: ' || j;
            DBMS_OUTPUT.PUT_LINE(v_result);
        END LOOP;
    END LOOP;
END;
/

/*
====================================
      Section 3: Cursor FOR LOOP
====================================
*/

-- Sample data setup
CREATE TABLE employees (
    employee_id NUMBER,
    first_name  VARCHAR2(50),
    salary      NUMBER
);

INSERT INTO employees VALUES (1, 'Alice', 5000);
INSERT INTO employees VALUES (2, 'Bob', 4500);
INSERT INTO employees VALUES (3, 'Charlie', 6000);
COMMIT;

-- Example 4: Cursor FOR LOOP
DECLARE
    CURSOR emp_cursor IS
        SELECT first_name, salary FROM employees;
BEGIN
    FOR emp_record IN emp_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_record.first_name || ' | Salary: ' || emp_record.salary);
    END LOOP;
END;
/

/*
====================================
      Section 4: EXIT and CONTINUE
====================================
*/

-- Example 5: Using EXIT in FOR LOOP
DECLARE
    v_sum NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        v_sum := v_sum + i;
        DBMS_OUTPUT.PUT_LINE('Iteration: ' || i || ' | Sum: ' || v_sum);
        IF v_sum > 15 THEN
            DBMS_OUTPUT.PUT_LINE('Sum exceeds 15, exiting loop.');
            EXIT;
        END IF;
    END LOOP;
END;
/

-- Example 6: Using CONTINUE in FOR LOOP
DECLARE
BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 0 THEN
            CONTINUE; -- Skip even numbers
        END IF;
        DBMS_OUTPUT.PUT_LINE('Odd number: ' || i);
    END LOOP;
END;
/

/*
====================================
  Section 5: Common Pitfalls and Tips
====================================
*/

/*
1. Infinite Loops: 
   - Not a concern with FOR LOOP as the iteration range is fixed.
2. Performance:
   - Avoid complex logic inside the loop; pre-calculate if possible.
3. Cursor FOR Loops:
   - Ensure proper indexes on the tables to avoid performance issues.
4. Debugging:
   - Use DBMS_OUTPUT to log intermediate values during each iteration.
*/