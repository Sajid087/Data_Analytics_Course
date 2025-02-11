/*
====================================================
Section 1: Definition and Purpose of GOTO Statements
====================================================
*/
-- The GOTO statement provides unconditional branching in PL/SQL.
-- It allows the flow of execution to jump to a labeled section of code.
-- While GOTO can be useful in certain scenarios, it is generally avoided
-- due to its potential to make code less readable and harder to maintain.

/*
================================================
Section 2: Syntax and Structure of GOTO Statement
================================================
*/
-- Syntax:
-- GOTO <label_name>;
-- 
-- A label must be defined in the PL/SQL block using the following format:
-- <label_name>: 
-- Example:
-- <<label_name>>
-- BEGIN
--    ...
--    GOTO label_name;
--    ...
-- <<label_name>>
--    ...

/*
==========================================
Section 3: Practical Examples of GOTO Usage
==========================================
*/

-- Example 1: Basic GOTO Statement
DECLARE
   v_counter NUMBER := 0;
BEGIN
   <<start_loop>>  -- Label definition
   v_counter := v_counter + 1;
   DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);

   IF v_counter < 5 THEN
      GOTO start_loop;  -- Jump to the label
   END IF;

   DBMS_OUTPUT.PUT_LINE('Exited loop after 5 iterations.');
END;
/

-- Example 2: Using GOTO in Error Handling
DECLARE
   v_num NUMBER := 10;
BEGIN
   IF v_num > 5 THEN
      GOTO error_label;  -- Unconditionally jump to error handling section
   END IF;

   DBMS_OUTPUT.PUT_LINE('This code is skipped.');

   <<error_label>>
   DBMS_OUTPUT.PUT_LINE('Error: v_num exceeds the allowed limit.');
END;
/

/*
===========================================================
Section 4: Nested GOTO and Complex Flow Control
===========================================================
*/
-- Example 3: Nested GOTO Statements
DECLARE
   v_outer NUMBER := 1;
   v_inner NUMBER := 1;
BEGIN
   <<outer_loop>>
   WHILE v_outer <= 3 LOOP
      v_inner := 1;

      <<inner_loop>>
      WHILE v_inner <= 3 LOOP
         IF v_outer = 2 AND v_inner = 2 THEN
            GOTO skip_to_end;  -- Skip to the label
         END IF;

         DBMS_OUTPUT.PUT_LINE('Outer: ' || v_outer || ', Inner: ' || v_inner);
         v_inner := v_inner + 1;
      END LOOP inner_loop;

      v_outer := v_outer + 1;
   END LOOP outer_loop;

   <<skip_to_end>>
   DBMS_OUTPUT.PUT_LINE('Skipped inner loop when Outer = 2 and Inner = 2.');
END;
/

/*
=========================================
Section 5: Best Practices and Pitfalls
=========================================
*/
-- 1. Best Practices:
--    - Use GOTO sparingly and only when it simplifies error handling or
--      avoids deeply nested conditions.
--    - Always provide meaningful label names for clarity.
--    - Document the purpose of each GOTO statement thoroughly.
--
-- 2. Common Pitfalls:
--    - Overusing GOTO can make code difficult to read and maintain.
--    - Avoid creating spaghetti code by jumping across large sections of code.
--    - Ensure that GOTO does not skip critical resource cleanup or finalization code.

/*
==================================================
Section 6: Comparison with Other Control Structures
==================================================
*/
-- 1. GOTO vs. IF-THEN-ELSE:
--    - IF-THEN-ELSE is preferred for conditional branching as it maintains logical flow.
--    - GOTO is unconditional and should only be used when IF-THEN-ELSE becomes cumbersome.
--
-- 2. GOTO vs. LOOP:
--    - Use LOOP for repetitive tasks instead of GOTO-based iterations.
--    - GOTO may be used to break out of nested loops in rare cases.

/*
=========================================
Section 7: Performance Considerations
=========================================
*/
-- 1. GOTO has minimal performance overhead but can lead to logical inefficiencies.
-- 2. Excessive use of GOTO may obscure the control flow, increasing debugging time.
-- 3. Avoid using GOTO in performance-critical sections of code.

/*
====================================================
Section 8: Coding Standards and Maintainability
====================================================
*/
-- 1. Avoid using GOTO unless absolutely necessary.
-- 2. Use meaningful and descriptive label names.
-- 3. Clearly comment each GOTO statement to explain its purpose.
-- 4. Regularly review and refactor code to eliminate unnecessary GOTO usage.

/*
===========================================================
Section 9: Warnings and Recommendations for Modern PL/SQL
===========================================================
*/
-- 1. Most modern PL/SQL applications rarely require GOTO.
-- 2. Use structured control flow constructs (e.g., IF, LOOP, CASE) instead.
-- 3. Only use GOTO for specialized use cases like error handling.
-- 4. Test thoroughly to ensure GOTO does not introduce bugs or security issues.