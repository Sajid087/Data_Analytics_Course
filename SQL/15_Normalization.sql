/*
======================================================
1. WHAT IS NORMALIZATION?
======================================================
Normalization is the process of organizing data in a database to:
- Reduce data redundancy
- Improve data integrity
- Optimize database performance

By breaking tables into smaller, related tables and defining relationships between them, normalization ensures efficient data storage and retrieval.
*/

-- Example: Unnormalized table (UNF)
CREATE TABLE Sales (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product1 VARCHAR(50),
    Product2 VARCHAR(50),
    Quantity1 INT,
    Quantity2 INT
);

/*
Problems in UNF:
- Repeated data for products and quantities.
- Difficult to add a new product without altering the table structure.
*/

/*
======================================================
2. FIRST NORMAL FORM (1NF)
======================================================
A table is in 1NF if:
1. All columns contain atomic (indivisible) values.
2. Each column contains values of a single type.
3. Rows are uniquely identifiable (usually via a primary key).
*/

-- 1NF Example: Splitting repeated fields into separate rows
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

/*
Advantages of 1NF:
- Eliminates duplicate columns.
- Ensures data is stored in a structured format.
*/

/*
======================================================
3. SECOND NORMAL FORM (2NF)
======================================================
A table is in 2NF if:
1. It is in 1NF.
2. All non-key attributes are fully dependent on the entire primary key (no partial dependencies).

Partial Dependency: A non-key column depends on only part of a composite primary key.
*/

-- Example: Partial Dependency (before 2NF)
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(50),
    CustomerName VARCHAR(50), -- Depends only on OrderID, not Product
    Quantity INT
);

-- Solution: Remove partial dependencies by splitting the table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product)
);

/*
======================================================
4. THIRD NORMAL FORM (3NF)
======================================================
A table is in 3NF if:
1. It is in 2NF.
2. All attributes are only dependent on the primary key (no transitive dependencies).

Transitive Dependency: A non-key column depends on another non-key column.
*/

-- Example: Transitive Dependency (before 3NF)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    CustomerAddress VARCHAR(100)
);

-- Solution: Remove transitive dependencies by creating separate tables
CREATE TABLE Customers (
    CustomerName VARCHAR(50) PRIMARY KEY,
    CustomerAddress VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    FOREIGN KEY (CustomerName) REFERENCES Customers(CustomerName)
);

/*
======================================================
5. BOYCE-CODD NORMAL FORM (BCNF)
======================================================
A table is in BCNF if:
1. It is in 3NF.
2. Every determinant is a candidate key.

Determinant: An attribute that uniquely determines another attribute.
*/

-- Example: BCNF Violation
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Instructor VARCHAR(50),
    PRIMARY KEY (StudentID, CourseID)
);

-- Issue: Instructor depends on CourseID, not on the composite key.

-- Solution: Split the table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Instructor VARCHAR(50)
);

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

/*
======================================================
6. FOURTH NORMAL FORM (4NF)
======================================================
A table is in 4NF if:
1. It is in BCNF.
2. It has no multi-valued dependencies.

Multi-valued Dependency: When one attribute is dependent on another, independent of other attributes.
*/

-- Example: Multi-valued Dependency (before 4NF)
CREATE TABLE Projects (
    EmployeeID INT,
    Skill VARCHAR(50),
    Project VARCHAR(50)
);

-- Solution: Split into two tables
CREATE TABLE EmployeeSkills (
    EmployeeID INT,
    Skill VARCHAR(50),
    PRIMARY KEY (EmployeeID, Skill)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    Project VARCHAR(50),
    PRIMARY KEY (EmployeeID, Project)
);

/*
======================================================
7. FIFTH NORMAL FORM (5NF)
======================================================
A table is in 5NF if:
1. It is in 4NF.
2. It cannot be decomposed further without losing data integrity.

5NF deals with cases where a table can be divided into smaller tables to remove redundancy while preserving data relationships.
*/

/*
======================================================
8. BEST PRACTICES AND DRAWBACKS
======================================================
Best Practices:
- Normalize to 3NF for most practical use cases.
- Use higher normal forms (BCNF, 4NF, 5NF) only when necessary.

Drawbacks of Over-Normalization:
- Increased complexity in query writing.
- Potential performance trade-offs due to excessive joins.

Denormalization:
- Combine tables to improve read performance in systems with heavy read operations.
*/