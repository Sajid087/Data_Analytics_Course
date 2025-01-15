/*
====================================
1. Definition of DDL
====================================
Data Definition Language (DDL) in SQL is used to define and manage database structures, such as tables, schemas, and indexes. DDL commands are essential for creating, modifying, and deleting database objects.

Key characteristics of DDL:
- Focuses on the schema-level operations.
- Automatically commits changes (autocommit).
- Does not manipulate the data itself (unlike DML).
*/

/*
====================================
2. Main DDL Commands
====================================
- CREATE: Used to create new database objects such as tables, views, and indexes.
- ALTER: Used to modify existing database objects.
- DROP: Used to delete database objects.
- TRUNCATE: Used to remove all rows from a table while keeping the structure.
- RENAME: Used to rename database objects.
*/

/*
====================================
3. CREATE Command
====================================
Purpose: Creates new database objects like tables, views, schemas, or indexes.
Syntax:
CREATE TABLE table_name (
    column_name data_type [constraint],
    ...
);
*/
-- Example: Creating a table with constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE DEFAULT CURRENT_DATE,
    salary DECIMAL(10, 2) CHECK (salary > 0)
);

-- Example: Creating an index
CREATE INDEX idx_last_name ON employees(last_name);

/*
====================================
4. ALTER Command
====================================
Purpose: Modifies the structure of an existing database object.
Syntax:
ALTER TABLE table_name
    ADD column_name data_type [constraint];
    
ALTER TABLE table_name
    MODIFY column_name data_type;
    
ALTER TABLE table_name
    DROP COLUMN column_name;
*/
-- Example: Adding a column
ALTER TABLE employees ADD department_id INT;

-- Example: Modifying a column
ALTER TABLE employees MODIFY salary DECIMAL(12, 2);

-- Example: Dropping a column
ALTER TABLE employees DROP COLUMN department_id;

/*
====================================
5. DROP Command
====================================
Purpose: Deletes database objects like tables, views, or indexes.
Syntax:
DROP TABLE table_name;
DROP INDEX index_name;
*/
-- Example: Dropping a table
DROP TABLE employees;

-- Example: Dropping an index
DROP INDEX idx_last_name;

/*
====================================
6. TRUNCATE Command
====================================
Purpose: Removes all rows from a table without logging individual row deletions. The table structure remains intact.
Syntax:
TRUNCATE TABLE table_name;
*/
-- Example: Truncating a table
TRUNCATE TABLE employees;

/*
====================================
7. RENAME Command
====================================
Purpose: Renames an existing database object.
Syntax:
RENAME TABLE old_name TO new_name;
*/
-- Example: Renaming a table
RENAME TABLE employees TO staff;

/*
====================================
8. Best Practices for Using DDL Commands
====================================
- Always back up your database before performing DDL operations.
- Use descriptive and consistent naming conventions for database objects.
- Test DDL commands in a development environment before executing them in production.
- Use constraints (e.g., PRIMARY KEY, FOREIGN KEY) to enforce data integrity.
*/

/*
====================================
9. Common Constraints in DDL
====================================
- PRIMARY KEY: Ensures unique identification of each record.
- FOREIGN KEY: Maintains referential integrity between tables.
- UNIQUE: Ensures all values in a column are distinct.
- NOT NULL: Prevents NULL values in a column.
- CHECK: Validates values based on a condition.
*/
-- Example: Using constraints in table creation
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

/*
====================================
10. Security Considerations
====================================
- Restrict DDL privileges to trusted users to prevent unauthorized schema modifications.
- Use roles and permissions to control access to DDL commands.
*/
-- Example: Granting and revoking DDL permissions
GRANT CREATE, ALTER, DROP ON DATABASE my_database TO admin_user;
REVOKE DROP ON DATABASE my_database FROM regular_user;

/*
====================================
11. DDL vs. Other SQL Command Types
====================================
- DDL: Defines and manages database schema (e.g., CREATE, ALTER).
- DML: Manipulates data within tables (e.g., INSERT, UPDATE, DELETE).
- DCL: Manages access and permissions (e.g., GRANT, REVOKE).
- TCL: Manages transactions (e.g., COMMIT, ROLLBACK).
*/

/*
====================================
12. Impact of DDL Operations on Performance
====================================
- DDL commands can lock the schema, affecting concurrent access.
- Large schema changes may require significant resources.
- Index creation improves query performance but may slow down data modifications.
*/

-- Example: Adding an index to improve query performance
CREATE INDEX idx_salary ON employees(salary);