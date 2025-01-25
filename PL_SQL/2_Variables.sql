/*
---------------------------------------------------------
1. Definition and Purpose of Variables in PL/SQL
---------------------------------------------------------
- Variables in PL/SQL are placeholders that store data values.
- They are used to perform operations, store intermediate results, and pass values between blocks.
*/

-- Example: Basic Variable Declaration
DECLARE
    v_employee_name VARCHAR2(50); -- Variable to store employee name
BEGIN
    v_employee_name := 'John Doe';
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_name);
END;
/

/*
---------------------------------------------------------
2. Types of Variables in PL/SQL
---------------------------------------------------------
- Scalar: Stores single data values (e.g., NUMBER, VARCHAR2, DATE).
- Composite: Stores multiple values (e.g., RECORD, TABLE).
- Reference: Points to a memory location (e.g., CURSOR variables).
- LOB: Stores large objects (e.g., BLOB, CLOB).
*/

-- Scalar Variable Example
DECLARE
    v_salary NUMBER(10, 2); -- Variable to store salary
BEGIN
    v_salary := 50000.75;
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
END;
/

-- Composite Variable Example
DECLARE
    TYPE t_employee IS RECORD (
        employee_id NUMBER,
        employee_name VARCHAR2(50)
    );
    v_employee t_employee; -- Composite variable
BEGIN
    v_employee.employee_id := 101;
    v_employee.employee_name := 'Alice';
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_employee.employee_id || ', Name: ' || v_employee.employee_name);
END;
/

/*
---------------------------------------------------------
3. Variable Declaration Syntax and Naming Conventions
---------------------------------------------------------
- Syntax: variable_name data_type [NOT NULL] [:= value];
- Use meaningful names and follow consistent naming conventions (e.g., prefix variables with "v_").
*/

-- Example: Declaring Multiple Variables
DECLARE
    v_dept_name VARCHAR2(30) := 'HR';
    v_dept_id NUMBER(5) := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Department: ' || v_dept_name || ' (ID: ' || v_dept_id || ')');
END;
/

/*
---------------------------------------------------------
4. Scope and Lifetime of Variables
---------------------------------------------------------
- Local: Declared within a block, only accessible in that block.
- Global: Declared in a package, accessible across sessions.
- Package-level: Declared in a package specification.
*/

-- Local Variable Example
BEGIN
    DECLARE
        v_local_var NUMBER := 100; -- Local variable
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Local Variable Value: ' || v_local_var);
    END;
END;
/

/*
---------------------------------------------------------
5. Variable Initialization and Assignment
---------------------------------------------------------
- Initialization: Assigning a value during declaration.
- Assignment: Updating a value using the assignment operator (:=).
*/

-- Example: Variable Initialization and Assignment
DECLARE
    v_count NUMBER := 0; -- Initialization
BEGIN
    v_count := v_count + 1; -- Assignment
    DBMS_OUTPUT.PUT_LINE('Count: ' || v_count);
END;
/

/*
---------------------------------------------------------
6. Anchored Declarations Using %TYPE and %ROWTYPE
---------------------------------------------------------
- %TYPE: Anchors a variable to the data type of a column or another variable.
- %ROWTYPE: Anchors a variable to an entire row of a table or cursor.
*/

-- %TYPE Example
DECLARE
    v_emp_name employees.first_name%TYPE; -- Anchored to employees.first_name
BEGIN
    SELECT first_name INTO v_emp_name FROM employees WHERE employee_id = 101;
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name);
END;
/

-- %ROWTYPE Example
DECLARE
    v_emp_record employees%ROWTYPE; -- Anchored to the structure of employees table
BEGIN
    SELECT * INTO v_emp_record FROM employees WHERE employee_id = 101;
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_emp_record.first_name || ' ' || v_emp_record.last_name);
END;
/

/*
---------------------------------------------------------
7. Constants and Their Declaration
---------------------------------------------------------
- Constants are variables whose values cannot be changed once assigned.
- Syntax: constant_name CONSTANT data_type := value;
*/

-- Example: Constant Declaration
DECLARE
    c_tax_rate CONSTANT NUMBER(5, 2) := 0.05; -- Tax rate constant
    v_amount NUMBER(10, 2) := 1000;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tax: ' || (v_amount * c_tax_rate));
END;
/

/*
---------------------------------------------------------
8. Best Practices for Variable Usage
---------------------------------------------------------
- Use meaningful and descriptive names.
- Initialize variables explicitly.
- Use %TYPE and %ROWTYPE for flexibility and maintainability.
- Avoid unnecessary variable declarations.
*/

/*
---------------------------------------------------------
9. Common Pitfalls and How to Avoid Them
---------------------------------------------------------
- Uninitialized variables: Always initialize variables before using them.
- Scope conflicts: Avoid using the same variable name in nested blocks.
- Overuse of global variables: Minimize the use of global variables to avoid unexpected behavior.
*/

-- Example: Avoiding Scope Conflicts
BEGIN
    DECLARE
        v_value NUMBER := 10; -- Outer variable
    BEGIN
        DECLARE
            v_value NUMBER := 20; -- Inner variable
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Inner Value: ' || v_value); -- Prints 20
        END;
        DBMS_OUTPUT.PUT_LINE('Outer Value: ' || v_value); -- Prints 10
    END;
END;
/