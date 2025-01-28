/*
===============================================================================
1. Definition and Purpose of LOOP Statements in PL/SQL
===============================================================================
LOOP statements in PL/SQL are used to execute a block of code repeatedly until 
a specified condition is met. They help automate repetitive tasks and are 
useful in scenarios like iterating over rows in a table, performing calculations, 
or generating reports.
*/

-- Example of a simple LOOP (Infinite Loop, terminate with EXIT)
DECLARE
    v_counter NUMBER := 1; -- Counter variable
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Counter Value: ' || v_counter);
        v_counter := v_counter + 1;

        -- Terminate the loop when the counter reaches 5
        EXIT WHEN v_counter > 5;
    END LOOP;
END;
/

/*
===============================================================================
2. Types of LOOP Statements in PL/SQL
===============================================================================
- Basic LOOP: Executes a block of code repeatedly until terminated with EXIT.
- FOR LOOP: Executes a block of code for a specific number of iterations.
- WHILE LOOP: Executes a block of code as long as a condition is true.
*/

/*
===============================================================================
3. Syntax and Structure for Each Type of LOOP
===============================================================================
*/

-- 3.1 Basic LOOP Example
DECLARE
    v_index NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Index: ' || v_index);
        v_index := v_index + 1;

        -- Terminate the loop explicitly
        EXIT WHEN v_index > 3;
    END LOOP;
END;
/

-- 3.2 FOR LOOP Example (Counter-Controlled Loop)
DECLARE
BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
    END LOOP;
END;
/

-- 3.3 WHILE LOOP Example (Condition-Controlled Loop)
DECLARE
    v_sum NUMBER := 0;
    v_counter NUMBER := 1;
BEGIN
    WHILE v_counter <= 5 LOOP
        v_sum := v_sum + v_counter;
        DBMS_OUTPUT.PUT_LINE('Sum so far: ' || v_sum);
        v_counter := v_counter + 1;
    END LOOP;
END;
/

/*
===============================================================================
4. Control Statements Within Loops (EXIT, EXIT WHEN, CONTINUE)
===============================================================================
*/

-- 4.1 Using EXIT
DECLARE
    v_num NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
        EXIT WHEN v_num = 3; -- Exit when the condition is met
        v_num := v_num + 1;
    END LOOP;
END;
/

-- 4.2 Using CONTINUE
DECLARE
BEGIN
    FOR i IN 1..5 LOOP
        IF MOD(i, 2) = 0 THEN
            CONTINUE; -- Skip even numbers
        END IF;
        DBMS_OUTPUT.PUT_LINE('Odd number: ' || i);
    END LOOP;
END;
/

/*
===============================================================================
5. Best Practices and Common Use Cases
===============================================================================
- Avoid infinite loops by ensuring a valid termination condition.
- Use FOR loops for counter-based iterations to minimize errors.
- Use WHILE loops for condition-based iterations where the number of iterations
  is unknown beforehand.
- Leverage CONTINUE to skip specific iterations.
*/

/*
===============================================================================
6. Performance Considerations
===============================================================================
- Minimize the amount of work inside loops to avoid performance bottlenecks.
- Use bulk operations like BULK COLLECT and FORALL when processing large datasets.
- Avoid nested loops where possible; they can cause exponential growth in 
  processing time.
*/

-- Example: Nested Loops (Use with caution for large datasets)
DECLARE
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..2 LOOP
            DBMS_OUTPUT.PUT_LINE('Outer Loop: ' || i || ', Inner Loop: ' || j);
        END LOOP;
    END LOOP;
END;
/

/*
===============================================================================
7. Error Handling in Loops
===============================================================================
*/

-- Example: Handling Errors Inside a Loop
DECLARE
    v_num NUMBER := 1;
BEGIN
    LOOP
        BEGIN
            -- Simulate an error when v_num = 3
            IF v_num = 3 THEN
                RAISE_APPLICATION_ERROR(-20001, 'Simulated Error at v_num = 3');
            END IF;
            DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
                EXIT; -- Exit the loop on error
        END;
        v_num := v_num + 1;
    END LOOP;
END;
/

/*
===============================================================================
8. Practical Examples: Cursor Loops
===============================================================================
*/

-- Using a Cursor Loop to Process Rows from a Table
DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, last_name FROM employees WHERE department_id = 10;
    v_employee_id employees.employee_id%TYPE;
    v_last_name employees.last_name%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_employee_id, v_last_name;
        EXIT WHEN emp_cursor%NOTFOUND; -- Exit when no more rows to fetch
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', Last Name: ' || v_last_name);
    END LOOP;
    CLOSE emp_cursor;
END;
/

/*
===============================================================================
9. Cautionary Notes
===============================================================================
- Ensure termination conditions are met to avoid infinite loops.
- Minimize the use of nested loops to reduce complexity.
- Avoid performing expensive operations inside loops.
*/