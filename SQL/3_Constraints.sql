/*
====================================
1. Definition and Purpose of SQL Constraints
====================================
SQL constraints are rules enforced on columns in a table to ensure data integrity and consistency. Constraints define how data can be stored in a database and help prevent invalid data entry.
*/

-- Example: Simple table with constraints
CREATE TABLE example_table (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE
);

/*
====================================
2. Types of Constraints
====================================
Constraints are categorized as follows:
- PRIMARY KEY: Ensures a column (or set of columns) uniquely identifies each row.
- FOREIGN KEY: Ensures data consistency by linking one table to another.
- UNIQUE: Ensures all values in a column are distinct.
- NOT NULL: Ensures a column cannot have NULL values.
- CHECK: Validates values based on a condition.
- DEFAULT: Specifies a default value for a column if no value is provided.
*/

/*
====================================
3. PRIMARY KEY Constraint
====================================
The PRIMARY KEY uniquely identifies each record in a table. A table can only have one primary key, which can consist of single or multiple columns.
*/
-- Example: Single-column primary key
CREATE TABLE primary_key_example (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Example: Composite primary key
CREATE TABLE composite_key_example (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id)
);

/*
====================================
4. FOREIGN KEY Constraint
====================================
The FOREIGN KEY ensures referential integrity by linking one table to another.
*/
-- Example: Foreign key constraint
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

/*
====================================
5. UNIQUE Constraint
====================================
The UNIQUE constraint ensures that all values in a column are distinct.
*/
-- Example: Unique constraint on a single column
CREATE TABLE unique_example (
    username VARCHAR(50) UNIQUE
);

-- Example: Unique constraint on multiple columns
CREATE TABLE multi_unique_example (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    UNIQUE (first_name, last_name)
);

/*
====================================
6. NOT NULL Constraint
====================================
The NOT NULL constraint ensures that a column cannot have NULL values.
*/
-- Example: NOT NULL constraint
CREATE TABLE not_null_example (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

/*
====================================
7. CHECK Constraint
====================================
The CHECK constraint validates data against a specified condition.
*/
-- Example: Check constraint on a single column
CREATE TABLE check_example (
    age INT CHECK (age >= 18)
);

-- Example: Check constraint on multiple columns
CREATE TABLE salary_check_example (
    base_salary DECIMAL(10, 2),
    bonus DECIMAL(10, 2),
    CHECK (bonus <= base_salary * 0.5)
);

/*
====================================
8. DEFAULT Constraint
====================================
The DEFAULT constraint provides a default value for a column if no value is specified.
*/
-- Example: Default constraint
CREATE TABLE default_example (
    id INT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*
====================================
9. Best Practices for Using Constraints
====================================
- Always use PRIMARY KEY and NOT NULL for critical identifiers.
- Use FOREIGN KEYS to maintain relationships between tables.
- Use CHECK constraints for business rules validation.
- Use UNIQUE to enforce data uniqueness where applicable.
- Use descriptive names for constraints for better readability.
*/

/*
====================================
10. Constraint Naming Conventions
====================================
- Use clear and consistent names like: `pk_table_name`, `fk_table_column`, `chk_column_name`, `unique_column_name`.
*/
-- Example: Naming constraints
CREATE TABLE named_constraints_example (
    id INT CONSTRAINT pk_named_constraints PRIMARY KEY,
    email VARCHAR(255) CONSTRAINT unique_email UNIQUE,
    age INT CONSTRAINT chk_age CHECK (age >= 18)
);

/*
====================================
11. Modifying and Dropping Constraints
====================================
Constraints can be modified or dropped after table creation.
*/
-- Example: Adding a new constraint
ALTER TABLE named_constraints_example
ADD CONSTRAINT fk_example FOREIGN KEY (id) REFERENCES another_table(id);

-- Example: Dropping a constraint
ALTER TABLE named_constraints_example
DROP CONSTRAINT fk_example;

/*
====================================
12. Error Handling Related to Constraints
====================================
- Ensure data complies with constraints before inserting/updating.
- Common errors include:
  - `Duplicate entry`: Violates UNIQUE or PRIMARY KEY.
  - `Cannot add or update child row`: Violates FOREIGN KEY.
  - `CHECK constraint failed`: Violates CHECK conditions.
*/
-- Example: Handling duplicate entry error
-- Attempting to insert a duplicate value into a unique column will result in an error:
INSERT INTO unique_example (username) VALUES ('duplicate_user');
-- Ensure values are unique before inserting:
SELECT * FROM unique_example WHERE username = 'duplicate_user';

/*
====================================
13. Performance Implications
====================================
- Constraints improve data integrity but can impact write performance.
- Use constraints judiciously to balance integrity and performance.
- Indexes created by constraints (e.g., UNIQUE, PRIMARY KEY) can speed up queries.
*/
-- Example: Query optimization with indexes
EXPLAIN SELECT * FROM unique_example WHERE username = 'test_user';