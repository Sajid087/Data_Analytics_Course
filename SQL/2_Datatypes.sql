/*
====================================
1. Definition and Purpose of SQL Data Types
====================================
SQL data types define the type of data that can be stored in a table column. They ensure data integrity, optimize storage, and improve query performance by specifying the kind of data (e.g., numeric, textual, date) that a column can hold.
*/

-- Example: Basic table with various data types
CREATE TABLE example_table (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

/*
====================================
2. Numeric Types
====================================
Numeric data types are used for storing numbers. They can be integer or floating-point numbers.

- INT: Integer values. Storage size: 4 bytes. Range: -2,147,483,648 to 2,147,483,647.
- BIGINT: Large integers. Storage size: 8 bytes. Range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807.
- DECIMAL(p, s): Fixed-point numbers. Precise for financial calculations.
- FLOAT: Approximate floating-point numbers. Use for scientific calculations.
*/
-- Example: Using numeric types
CREATE TABLE numeric_example (
    id INT,
    large_number BIGINT,
    price DECIMAL(10, 2),
    scientific_value FLOAT
);

/*
====================================
3. Character/String Types
====================================
Character data types are used to store text.

- CHAR(n): Fixed-length strings. Best for consistently sized data.
- VARCHAR(n): Variable-length strings. More efficient for variable-sized data.
- TEXT: Large text data. Limited indexing capabilities.
*/
-- Example: Using string types
CREATE TABLE string_example (
    code CHAR(10),
    description VARCHAR(255),
    details TEXT
);

/*
====================================
4. Date and Time Types
====================================
Date and time data types are used to store temporal data.

- DATE: Stores dates (YYYY-MM-DD).
- TIME: Stores time (HH:MM:SS).
- DATETIME: Stores both date and time (YYYY-MM-DD HH:MM:SS).
- TIMESTAMP: Stores date and time, automatically adjusts for time zones.
*/
-- Example: Using date and time types
CREATE TABLE datetime_example (
    event_date DATE,
    event_time TIME,
    created_at DATETIME,
    updated_at TIMESTAMP
);

/*
====================================
5. Binary Types
====================================
Binary data types are used to store binary data like files and images.

- BINARY(n): Fixed-length binary data.
- VARBINARY(n): Variable-length binary data.
- BLOB: Large binary objects, suitable for storing multimedia files.
*/
-- Example: Using binary types
CREATE TABLE binary_example (
    id INT,
    image BLOB
);

/*
====================================
6. Boolean Type
====================================
Boolean data type stores true/false values. In some databases (e.g., MySQL), BOOLEAN is represented as TINYINT (1 = true, 0 = false).
*/
-- Example: Using boolean type
CREATE TABLE boolean_example (
    is_active BOOLEAN
);

/*
====================================
7. Special Types
====================================
- JSON: Stores JSON data. Useful for unstructured or semi-structured data.
- XML: Stores XML data. Less commonly used than JSON.
- UUID: Universally Unique Identifier. Used for globally unique identifiers.
*/
-- Example: Using special types
CREATE TABLE special_example (
    config_data JSON,
    unique_id UUID
);

/*
====================================
8. Best Practices for Choosing Data Types
====================================
- Use the smallest data type that can accommodate your data to save storage and improve performance.
- Prefer VARCHAR over TEXT unless large text storage is necessary.
- Use INT or BIGINT for IDs, but choose BIGINT only if large ranges are expected.
- Use DECIMAL for financial data to avoid rounding errors.
- Use DATE, TIME, or DATETIME instead of strings for temporal data to enable date/time functions.
*/

-- Example: Optimized table design
CREATE TABLE optimized_example (
    user_id INT,
    username VARCHAR(50),
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*
====================================
9. Memory Optimization Considerations
====================================
- Avoid over-allocating sizes for VARCHAR and DECIMAL.
- Use indexes judiciously to improve query performance.
- Normalize data to reduce redundancy and save space.
*/

-- Example: Adding an index for performance
CREATE INDEX idx_username ON optimized_example (username);

/*
====================================
10. Compatibility Issues Across SQL Databases
====================================
- Data type names and behaviors may vary across databases. For example, MySQL's TINYINT(1) is used for BOOLEAN, while PostgreSQL has a native BOOLEAN type.
- Always consult database-specific documentation when designing schemas.
*/
-- Example: Compatibility note
-- MySQL: Use VARCHAR(255) for variable strings.
-- PostgreSQL: Use TEXT for unlimited strings (no performance difference from VARCHAR).