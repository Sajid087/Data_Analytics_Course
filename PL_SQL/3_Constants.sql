/*
SECTION 1: DEFINITION AND PURPOSE OF CONSTANTS
-------------------------------------------------------------------------------
- A constant in PL/SQL is a variable whose value remains unchanged once assigned.
- Constants are used to store values that should not be modified during program execution.
- They improve code readability, maintainability, and reduce the risk of accidental changes.
*/

-- Syntax for declaring a constant:
-- constant_name CONSTANT data_type := value;

/*
SECTION 2: SYNTAX FOR DECLARING CONSTANTS USING THE CONSTANT KEYWORD
-------------------------------------------------------------------------------
*/
DECLARE
    pi CONSTANT NUMBER := 3.14159; -- A constant for the mathematical value of Pi
    greeting CONSTANT VARCHAR2(50) := 'Welcome to PL/SQL!'; -- A string constant
BEGIN
    DBMS_OUTPUT.PUT_LINE('Value of Pi: ' || pi);
    DBMS_OUTPUT.PUT_LINE('Greeting: ' || greeting);
END;
/

/*
SECTION 3: DIFFERENT TYPES OF CONSTANTS
-------------------------------------------------------------------------------
1. Numeric constants (NUMBER, BINARY_FLOAT, BINARY_DOUBLE)
2. Character constants (CHAR, VARCHAR2, NCHAR, NVARCHAR2)
3. Boolean constants (BOOLEAN)
*/

-- Example: Numeric, Character, and Boolean constants
DECLARE
    max_employees CONSTANT NUMBER := 100;
    company_name CONSTANT VARCHAR2(30) := 'TechCorp';
    is_active CONSTANT BOOLEAN := TRUE;
BEGIN
    IF is_active THEN
        DBMS_OUTPUT.PUT_LINE(company_name || ' can have up to ' || max_employees || ' employees.');
    END IF;
END;
/

/*
SECTION 4: SCOPE OF CONSTANTS (LOCAL VS. GLOBAL)
-------------------------------------------------------------------------------
- Local Constants: Declared within a block or subprogram and accessible only within that scope.
- Global Constants: Declared in a package specification and accessible throughout the database session.
*/

-- Example: Local constant
DECLARE
    local_constant CONSTANT NUMBER := 42;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Local constant value: ' || local_constant);
END;
/

-- Example: Global constant (declared in a package)
CREATE OR REPLACE PACKAGE my_package IS
    global_constant CONSTANT VARCHAR2(20) := 'Global Value';
END my_package;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(my_package.global_constant);
END;
/

/*
SECTION 5: BEST PRACTICES FOR NAMING AND USAGE
-------------------------------------------------------------------------------
1. Use meaningful and descriptive names for constants (e.g., TAX_RATE, MAX_LIMIT).
2. Follow a consistent naming convention (e.g., use uppercase letters with underscores).
3. Declare constants in a package for reuse across multiple blocks or modules.
*/

-- Example: Naming convention
DECLARE
    TAX_RATE CONSTANT NUMBER := 0.18; -- Tax rate as a constant
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tax Rate: ' || TO_CHAR(TAX_RATE * 100) || '%');
END;
/

/*
SECTION 6: DIFFERENCES BETWEEN CONSTANTS AND VARIABLES
-------------------------------------------------------------------------------
- Constants: Value cannot change once assigned. Use the CONSTANT keyword.
- Variables: Value can change during execution.
*/

-- Example illustrating the difference
DECLARE
    my_constant CONSTANT NUMBER := 10;
    my_variable NUMBER := 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Constant: ' || my_constant);
    my_variable := my_variable + 10; -- Allowed for variables
    DBMS_OUTPUT.PUT_LINE('Variable: ' || my_variable);
END;
/

/*
SECTION 7: BENEFITS OF USING CONSTANTS
-------------------------------------------------------------------------------
1. Protect values from unintended modifications.
2. Improve code readability and maintainability.
3. Centralize values for easier updates.
*/

/*
SECTION 8: COMMON USE CASES AND EXAMPLES
-------------------------------------------------------------------------------
- Use constants for:
  1. Mathematical values (e.g., Pi, Euler's number)
  2. Configuration settings (e.g., tax rates, maximum limits)
  3. Fixed business rules (e.g., standard discount rates)
*/

-- Example: Using constants in calculations
DECLARE
    TAX_RATE CONSTANT NUMBER := 0.15;
    product_price NUMBER := 200;
    total_price NUMBER;
BEGIN
    total_price := product_price + (product_price * TAX_RATE);
    DBMS_OUTPUT.PUT_LINE('Total Price (including tax): ' || total_price);
END;
/

/*
SECTION 9: ERROR HANDLING CONSIDERATIONS
-------------------------------------------------------------------------------
- Attempting to modify a constant's value will result in a compilation error.
- Example:
*/

DECLARE
    my_constant CONSTANT NUMBER := 100;
BEGIN
    -- my_constant := 200; -- Uncommenting this will cause an error
END;
/

/*
SECTION 10: PERFORMANCE IMPLICATIONS
-------------------------------------------------------------------------------
- Using constants can improve performance by avoiding recalculations.
- Example: Replace repeated expressions with constants for efficiency.
*/