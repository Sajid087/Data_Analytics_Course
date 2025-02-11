/******************************************************
 * 1. Definition and Purpose of CONTINUE
 ******************************************************
 * - The CONTINUE statement in PL/SQL is used to skip 
 *   the remaining statements in the current iteration 
 *   of a loop and proceed to the next iteration.
 * - It is commonly used to improve the readability and 
 *   flow of loops by handling specific conditions.
 ******************************************************/

-- Example: Basic CONTINUE Statement
DECLARE
    v_counter NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        v_counter := v_counter + 1;
        IF MOD(i, 2) = 0 THEN
            CONTINUE; -- Skip even numbers
        END IF;
        DBMS_OUTPUT.PUT_LINE('Processing odd number: ' || i);
    END LOOP;
END;
/

/******************************************************
 * 2. Syntax and Usage Examples
 ******************************************************
 * Syntax:
 *   CONTINUE;
 *   CONTINUE WHEN <condition>;
 *
 * - Use CONTINUE to skip to the next iteration unconditionally.
 * - Use CONTINUE WHEN to skip conditionally.
 ******************************************************/

-- Example: CONTINUE with WHEN Clause
DECLARE
    v_counter NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        v_counter := v_counter + 1;
        CONTINUE WHEN MOD(i, 2) = 0; -- Skip even numbers
        DBMS_OUTPUT.PUT_LINE('Processing odd number: ' || i);
    END LOOP;
END;
/

/******************************************************
 * 3. How CONTINUE Differs from EXIT and GOTO
 ******************************************************
 * - CONTINUE skips the current iteration and moves to 
 *   the next iteration.
 * - EXIT terminates the loop entirely.
 * - GOTO transfers control to a labeled statement.
 *
 * Comparison Example:
 *   - CONTINUE: Skips even numbers, processes odd ones.
 *   - EXIT: Stops loop when a condition is met.
 ******************************************************/

-- Example: CONTINUE vs. EXIT
DECLARE
    v_sum NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        IF i = 5 THEN
            EXIT; -- Exit the loop when i = 5
        ELSIF MOD(i, 2) = 0 THEN
            CONTINUE; -- Skip even numbers
        END IF;
        v_sum := v_sum + i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Sum of processed numbers: ' || v_sum);
END;
/

/******************************************************
 * 4. Common Use Cases and Scenarios
 ******************************************************
 * - Skipping invalid or irrelevant data during iteration.
 * - Simplifying logic by avoiding deeply nested IF statements.
 * - Enhancing readability in loops with complex conditions.
 ******************************************************/

-- Example: Skipping Invalid Data
DECLARE
    TYPE t_numbers IS TABLE OF NUMBER;
    v_data t_numbers := t_numbers(10, NULL, 20, NULL, 30);
BEGIN
    FOR i IN 1..v_data.COUNT LOOP
        IF v_data(i) IS NULL THEN
            CONTINUE; -- Skip NULL values
        END IF;
        DBMS_OUTPUT.PUT_LINE('Processing: ' || v_data(i));
    END LOOP;
END;
/

/******************************************************
 * 5. Best Practices and Considerations
 ******************************************************
 * - Use CONTINUE to improve readability and flow but avoid 
 *   overusing it in deeply nested loops.
 * - Always ensure the loop has a termination condition 
 *   to avoid infinite loops.
 * - Comment clearly when using CONTINUE to explain 
 *   why certain iterations are skipped.
 ******************************************************/

-- Example: Nested Loops with CONTINUE
DECLARE
    TYPE t_matrix IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    v_matrix t_matrix;
BEGIN
    -- Populate a 2D-like matrix (1D array with offsets)
    FOR i IN 1..3 LOOP
        FOR j IN 1..3 LOOP
            v_matrix((i - 1) * 3 + j) := i * j;
        END LOOP;
    END LOOP;

    -- Process the matrix and skip diagonal elements
    FOR i IN 1..3 LOOP
        FOR j IN 1..3 LOOP
            IF i = j THEN
                CONTINUE; -- Skip diagonal elements
            END IF;
            DBMS_OUTPUT.PUT_LINE('Processing element (' || i || ',' || j || '): ' || v_matrix((i - 1) * 3 + j));
        END LOOP;
    END LOOP;
END;
/

/******************************************************
 * 6. Performance Implications
 ******************************************************
 * - CONTINUE has minimal overhead and can improve the 
 *   performance of loops by avoiding unnecessary processing.
 * - Use CONTINUE WHEN for conditions that are likely to be 
 *   true frequently to skip iterations early.
 ******************************************************/

-- Example: CONTINUE WHEN for Performance Optimization
DECLARE
    v_large_table SYS_REFCURSOR;
    v_value NUMBER;
BEGIN
    OPEN v_large_table FOR SELECT ROWNUM FROM DUAL CONNECT BY LEVEL <= 100;
    LOOP
        FETCH v_large_table INTO v_value;
        EXIT WHEN v_large_table%NOTFOUND;

        -- Skip numbers divisible by 10
        CONTINUE WHEN MOD(v_value, 10) = 0;
        DBMS_OUTPUT.PUT_LINE('Processing value: ' || v_value);
    END LOOP;
    CLOSE v_large_table;
END;
/

/******************************************************
 * 7. Common Pitfalls to Avoid
 ******************************************************
 * - Infinite Loops: Ensure the loop has an appropriate 
 *   termination condition.
 * - Overuse: Excessive CONTINUE statements can make 
 *   code harder to read and maintain.
 * - Ambiguous Logic: Clearly comment why certain 
 *   iterations are skipped.
 ******************************************************/

-- Example: Infinite Loop Prevention
DECLARE
    v_counter NUMBER := 0;
BEGIN
    WHILE v_counter < 10 LOOP
        v_counter := v_counter + 1;
        IF MOD(v_counter, 2) = 0 THEN
            CONTINUE; -- Skip even numbers
        END IF;
        DBMS_OUTPUT.PUT_LINE('Counter value: ' || v_counter);
    END LOOP;
END;
/

/******************************************************
 * 8. Comparison with CONTINUE in Other Programming Languages
 ******************************************************
 * - Similar to CONTINUE in languages like Python, Java, 
 *   and C++ where it skips the current iteration and 
 *   moves to the next.
 * - PL/SQL CONTINUE can be conditionally used with WHEN, 
 *   providing additional flexibility.
 ******************************************************/