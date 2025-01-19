/*
============================================
1. What are Pseudo Columns?
============================================
Pseudo columns are special columns provided by SQL databases that behave like regular columns but do not actually exist in the database schema.
They are automatically available and are often used to retrieve metadata or system-generated values related to rows or queries.

Key Characteristics:
- They are not stored in tables but are accessible during query execution.
- They are database-specific and have unique functionalities depending on the database.
*/

/*
============================================
2. Common Pseudo Columns
============================================
Here are some commonly used pseudo columns:

1. ROWNUM (Oracle):
   - Assigns a unique number to each row returned by a query.
   - Use case: Limiting the number of rows in a result set.

2. ROWID (Oracle):
   - Represents the physical address of a row in the database.
   - Use case: Quickly accessing rows for performance optimization.

3. LEVEL (Oracle):
   - Indicates the level of a node in a hierarchy (used with CONNECT BY clause).
   - Use case: Hierarchical queries such as organizational charts.

4. CONNECT_BY_ISLEAF (Oracle):
   - Identifies if a node in a hierarchy is a leaf node.
   - Use case: Finding terminal nodes in a hierarchy.

5. CTID (PostgreSQL):
   - Represents the physical location of a row in a table.
   - Use case: Debugging and locating specific rows.

6. IDENT_CURRENT (SQL Server):
   - Retrieves the last identity value generated for a specified table.
   - Use case: Tracking inserted rows in identity columns.

7. ROW_NUMBER() (SQL Server, PostgreSQL, etc.):
   - Assigns a unique number to each row within a result set based on the specified order.
   - Use case: Paginating query results.
*/

-- Example: Using ROWNUM (Oracle)
SELECT *
FROM employees
WHERE ROWNUM <= 5;

/*
Explanation:
- ROWNUM is used to limit the result set to the first 5 rows.
*/

-- Example: Using ROWID (Oracle)
SELECT ROWID, first_name, last_name
FROM employees
WHERE department_id = 10;

/*
Explanation:
- ROWID helps locate the exact storage location of rows within the table.
*/

-- Example: Using LEVEL and CONNECT_BY_ISLEAF (Oracle)
SELECT employee_id, first_name, LEVEL, CONNECT_BY_ISLEAF
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

/*
Explanation:
- LEVEL indicates the depth of each employee in the hierarchy.
- CONNECT_BY_ISLEAF identifies whether the employee is a leaf node (no subordinates).
*/

-- Example: Using CTID (PostgreSQL)
SELECT ctid, *
FROM employees
LIMIT 5;

/*
Explanation:
- CTID retrieves the physical location of rows in the table, useful for debugging.
*/

-- Example: Using ROW_NUMBER() (SQL Server, PostgreSQL, etc.)
SELECT ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
       first_name, last_name, salary
FROM employees;

/*
Explanation:
- ROW_NUMBER() assigns a unique number to each row based on the descending order of salary.
- Commonly used for pagination.
*/

/*
============================================
3. Specific Use Cases and Limitations
============================================
1. ROWNUM:
   - Use for basic row filtering.
   - Limitation: Cannot be used with ORDER BY directly; sorting happens after ROWNUM assignment.

2. ROWID:
   - Use for identifying duplicate rows or debugging.
   - Limitation: Not portable between databases or sessions.

3. LEVEL:
   - Use for hierarchical queries.
   - Limitation: Works only with CONNECT BY in Oracle.

4. CTID:
   - Use for locating physical row versions in PostgreSQL.
   - Limitation: Changes when rows are updated or vacuumed.

5. ROW_NUMBER():
   - Use for advanced ordering and pagination.
   - Limitation: Requires an OVER clause with ordering criteria.
*/

-- Example: Using ROW_NUMBER() for Pagination
WITH PaginatedResults AS (
    SELECT ROW_NUMBER() OVER (ORDER BY hire_date DESC) AS row_num,
           first_name, last_name, hire_date
    FROM employees
)
SELECT *
FROM PaginatedResults
WHERE row_num BETWEEN 11 AND 20;

/*
Explanation:
- Retrieves rows 11 to 20 for pagination purposes.
*/

/*
============================================
4. Best Practices and Common Pitfalls
============================================
Best Practices:
1. Use pseudo columns for debugging and metadata queries.
2. Combine pseudo columns with analytic functions for advanced reporting.
3. Leverage database-specific pseudo columns appropriately based on the database.

Common Pitfalls:
1. Misusing pseudo columns outside their intended purpose.
2. Over-relying on ROWID or CTID, which can lead to non-portable queries.
3. Ignoring performance considerations when using pseudo columns with large datasets.
*/

/*
============================================
5. Database-Specific Implementations
============================================
1. Oracle: Supports ROWNUM, ROWID, LEVEL, CONNECT_BY_ISLEAF.
2. PostgreSQL: Supports CTID and ROW_NUMBER().
3. SQL Server: Supports ROW_NUMBER(), IDENT_CURRENT.
*/

/*
============================================
6. Performance Considerations and Optimization Tips
============================================
1. Use indexed columns in queries with pseudo columns to improve performance.
2. Limit result sets when using pseudo columns like ROW_NUMBER() to avoid unnecessary processing.
3. Analyze query plans to ensure efficient execution when pseudo columns are involved.
*/