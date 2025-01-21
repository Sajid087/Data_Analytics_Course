/*
=============================================
1. Fundamental Concept of Functional Dependencies
=============================================
Functional Dependency (FD) is a relationship between attributes in a table.
If attribute X uniquely determines attribute Y, we say that Y is functionally
dependent on X, denoted as X -> Y.

Key Points:
- Helps in ensuring data integrity.
- Plays a crucial role in database normalization.
*/

-- Example: Consider a table `Employees` with attributes EmployeeID, Name, and Department.
-- EmployeeID -> Name (Each EmployeeID uniquely determines a Name).
-- EmployeeID -> Department (Each EmployeeID uniquely determines a Department).

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, Name, Department)
VALUES (1, 'Alice', 'HR'),
       (2, 'Bob', 'IT'),
       (3, 'Charlie', 'Finance');

-- Functional Dependency:
-- EmployeeID -> Name, Department

/*
=============================================
2. Types of Functional Dependencies
=============================================
*/

/*
2.1 Full Functional Dependency
-------------------------------
Occurs when an attribute is fully dependent on the entire primary key.
*/
-- Example: In a composite key scenario:
CREATE TABLE Orders (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
-- Dependency: (OrderID, ProductID) -> Quantity

/*
2.2 Partial Functional Dependency
----------------------------------
Occurs when an attribute is dependent on only part of a composite primary key.
This is a violation of 2NF.
*/
-- Example: ProductID -> Quantity (violates full dependency).

/*
2.3 Transitive Functional Dependency
-------------------------------------
Occurs when non-key attributes depend on other non-key attributes.
This is a violation of 3NF.
*/
-- Example:
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ManagerID INT,
    ManagerName VARCHAR(100)
);
-- Dependency: ProjectID -> ManagerID -> ManagerName
-- Transitive Dependency: ManagerID -> ManagerName

/*
2.4 Multi-valued Dependency
----------------------------
Occurs when one attribute in a table uniquely determines another attribute,
independently of other attributes.
*/
-- Example:
CREATE TABLE Courses (
    StudentID INT,
    CourseID INT,
    HobbyID INT
);
-- Dependency: StudentID ->> CourseID and StudentID ->> HobbyID

/*
=============================================
3. Importance of Functional Dependencies in Normalization
=============================================
Functional dependencies are crucial for:
1. Eliminating redundancy.
2. Preventing update anomalies.
3. Improving database efficiency and integrity.
*/

/*
=============================================
4. Real-World Examples for Each Type of Dependency
=============================================
*/

-- Example for Full Dependency:
CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    Grade CHAR(1),
    PRIMARY KEY (StudentID, CourseID)
);
-- Full Dependency: (StudentID, CourseID) -> Grade

-- Example for Partial Dependency:
CREATE TABLE Sales (
    OrderID INT,
    ProductID INT,
    ProductName VARCHAR(100),
    PRIMARY KEY (OrderID, ProductID)
);
-- Partial Dependency: ProductID -> ProductName

-- Example for Transitive Dependency:
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    PublisherID INT,
    PublisherName VARCHAR(100)
);
-- Transitive Dependency: ISBN -> PublisherID -> PublisherName

/*
=============================================
5. How to Identify and Resolve Functional Dependencies
=============================================
1. Identify attributes dependent on keys.
2. Break tables to eliminate partial and transitive dependencies.
3. Use normalization (1NF, 2NF, 3NF, BCNF).
*/

/*
=============================================
6. Best Practices for Managing Functional Dependencies
=============================================
- Use meaningful primary keys.
- Avoid redundant attributes.
- Regularly normalize tables to reduce anomalies.
*/

/*
=============================================
7. Common Problems and Solutions
=============================================
1. Redundancy: Normalize tables.
2. Anomalies: Use proper functional dependencies.
3. Performance issues: Optimize queries and indexes.
*/

-- Example of Normalization:
-- Unnormalized Table:
CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    ProjectID INT,
    ProjectName VARCHAR(100)
);

-- Normalized Tables:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100)
);

CREATE TABLE EmployeeProjectMapping (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

/*
=============================================
8. Tips for Maintaining Data Integrity
=============================================
- Define clear primary and foreign keys.
- Use constraints to enforce dependencies.
- Regularly audit and refine table structures.
*/