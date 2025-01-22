/*
=====================================================================
1. DEFINITION AND PURPOSE OF CURSORS
=====================================================================
A cursor is a database object used to retrieve, manipulate, and traverse
over the result set of a query row by row. Unlike set-based operations,
cursors allow row-by-row processing, which can be useful in scenarios
where iterative logic is required.

USE CASES:
- Performing row-by-row validations
- Complex transformations or computations
- Legacy systems where procedural logic is needed
=====================================================================
*/

/*
=====================================================================
2. TYPES OF CURSORS IN SQL SERVER
=====================================================================
- STATIC: Creates a temporary copy of the result set. Does not reflect
  changes made to the data after the cursor is opened.
- DYNAMIC: Reflects changes made to the underlying data while the
  cursor is open.
- FORWARD-ONLY: Allows only forward traversal through the result set.
- KEYSET: Reflects updates to data but not insertions or deletions.
=====================================================================
*/

/*
=====================================================================
3. SYNTAX AND COMPONENTS OF A CURSOR
=====================================================================
Basic structure of a cursor:

DECLARE cursor_name CURSOR FOR <SELECT QUERY>;
OPEN cursor_name;
FETCH NEXT FROM cursor_name INTO <VARIABLES>;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Processing logic
    FETCH NEXT FROM cursor_name INTO <VARIABLES>;
END;
CLOSE cursor_name;
DEALLOCATE cursor_name;
=====================================================================
*/

/*
=====================================================================
4. CURSOR OPERATIONS
=====================================================================
- DECLARE: Defines the cursor and associates it with a SELECT statement.
- OPEN: Executes the SELECT statement and populates the cursor.
- FETCH: Retrieves the next row from the cursor.
- CLOSE: Releases the result set associated with the cursor.
- DEALLOCATE: Removes the cursor definition and releases resources.
=====================================================================
*/

-- Example 1: Simple Cursor Implementation
-- Scenario: Print employee names and their departments row by row

-- Step 1: Create a sample table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    Department NVARCHAR(50)
);

-- Step 2: Insert sample data
INSERT INTO Employees (EmployeeID, EmployeeName, Department)
VALUES (1, 'Alice', 'HR'),
       (2, 'Bob', 'Finance'),
       (3, 'Charlie', 'IT');

-- Step 3: Declare and use the cursor
DECLARE employee_cursor CURSOR FOR
SELECT EmployeeName, Department
FROM Employees;

-- Declare variables to store fetched data
DECLARE @EmployeeName NVARCHAR(100);
DECLARE @Department NVARCHAR(50);

-- Open the cursor
OPEN employee_cursor;

-- Fetch the first row
FETCH NEXT FROM employee_cursor INTO @EmployeeName, @Department;

-- Loop through the result set
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Employee: ' + @EmployeeName + ', Department: ' + @Department;

    -- Fetch the next row
    FETCH NEXT FROM employee_cursor INTO @EmployeeName, @Department;
END;

-- Close and deallocate the cursor
CLOSE employee_cursor;
DEALLOCATE employee_cursor;

/*
=====================================================================
5. ADVANTAGES AND DISADVANTAGES OF CURSORS
=====================================================================
ADVANTAGES:
- Enables row-by-row processing of data
- Useful for operations that cannot be performed using set-based logic

DISADVANTAGES:
- Performance overhead due to row-by-row processing
- Slower compared to set-based operations for large data sets
=====================================================================
*/

/*
=====================================================================
6. BEST PRACTICES AND PERFORMANCE CONSIDERATIONS
=====================================================================
- Use cursors only when set-based solutions are not feasible.
- Minimize the result set by filtering rows with WHERE clauses.
- Use the FORWARD-ONLY cursor type for better performance.
- Always CLOSE and DEALLOCATE cursors to release resources.
=====================================================================
*/

-- Example 2: Cursor with Error Handling
BEGIN TRY
    DECLARE product_cursor CURSOR FOR
    SELECT ProductID, ProductName
    FROM Products;

    DECLARE @ProductID INT;
    DECLARE @ProductName NVARCHAR(100);

    OPEN product_cursor;

    FETCH NEXT FROM product_cursor INTO @ProductID, @ProductName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Processing Product: ' + @ProductName;
        FETCH NEXT FROM product_cursor INTO @ProductID, @ProductName;
    END;

    CLOSE product_cursor;
    DEALLOCATE product_cursor;
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    IF CURSOR_STATUS('global', 'product_cursor') >= 0
    BEGIN
        CLOSE product_cursor;
        DEALLOCATE product_cursor;
    END;
END CATCH;

/*
=====================================================================
7. ALTERNATIVES TO CURSORS
=====================================================================
- Use set-based operations whenever possible (e.g., JOINs, UPDATE with
  subqueries).
- Use window functions for row-by-row calculations.
- Use WHILE loops with temporary tables for iterative logic.
=====================================================================
*/