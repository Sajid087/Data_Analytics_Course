/*
1. What is a Self Join?
-----------------------
A Self Join is a type of join in SQL where a table is joined with itself.
This is achieved by treating the same table as if it were two different tables,
and then performing a standard join operation.
*/

/*
2. Purpose of a Self Join
-------------------------
The main purpose of a Self Join is to create relationships between rows
in the same table. It is often used to:
- Compare rows within the same table.
- Represent hierarchical data (e.g., manager-employee relationships).
- Find duplicate data or patterns.
*/

/*
3. Syntax and Structure of a Self Join
---------------------------------------
A Self Join requires the use of table aliases to differentiate between
the "instances" of the table being joined.

Example Syntax:
SELECT A.column1, B.column2
FROM table_name AS A
JOIN table_name AS B
  ON A.common_column = B.common_column;
*/

/*
4. When and Why to Use Self Join
---------------------------------
- To analyze hierarchical or parent-child relationships.
- To compare data within the same table.
- To identify patterns or duplicate values.
*/

-- Sample Tables and Data
-- Employees Table:
-- +----+------------+--------+------------+
-- | ID | Name       | Salary | Manager_ID |
-- +----+------------+--------+------------+
-- | 1  | Alice      | 70000  | NULL       |
-- | 2  | Bob        | 60000  | 1          |
-- | 3  | Charlie    | 50000  | 1          |
-- | 4  | David      | 45000  | 2          |
-- | 5  | Eve        | 40000  | 2          |
-- +----+------------+--------+------------+

/*
5. Practical Examples
*/

-- Example 1: Manager-Employee Relationships
/*
Find the names of employees and their respective managers.
*/
SELECT 
  E.Name AS Employee, 
  M.Name AS Manager
FROM Employees AS E
LEFT JOIN Employees AS M
  ON E.Manager_ID = M.ID;

-- Expected Output:
-- +----------+----------+
-- | Employee | Manager  |
-- +----------+----------+
-- | Alice    | NULL     |
-- | Bob      | Alice    |
-- | Charlie  | Alice    |
-- | David    | Bob      |
-- | Eve      | Bob      |
-- +----------+----------+

-- Example 2: Finding Employees with the Same Salary
/*
Find pairs of employees earning the same salary.
*/
SELECT 
  A.Name AS Employee1, 
  B.Name AS Employee2, 
  A.Salary
FROM Employees AS A
JOIN Employees AS B
  ON A.Salary = B.Salary
  AND A.ID < B.ID; -- Avoid duplicate pairs

-- Expected Output:
-- +-----------+-----------+--------+
-- | Employee1 | Employee2 | Salary |
-- +-----------+-----------+--------+
-- | David     | Eve       | 45000  |
-- +-----------+-----------+--------+

-- Example 3: Hierarchical Depth Reporting
/*
Find all employees and their managers, along with their salary difference.
*/
SELECT 
  E.Name AS Employee, 
  M.Name AS Manager, 
  E.Salary AS Employee_Salary, 
  M.Salary AS Manager_Salary, 
  E.Salary - M.Salary AS Salary_Difference
FROM Employees AS E
JOIN Employees AS M
  ON E.Manager_ID = M.ID;

-- Expected Output:
-- +----------+----------+----------------+----------------+----------------+
-- | Employee | Manager  | Employee_Salary| Manager_Salary | Salary_Difference |
-- +----------+----------+----------------+----------------+----------------+
-- | Bob      | Alice    | 60000          | 70000          | -10000          |
-- | Charlie  | Alice    | 50000          | 70000          | -20000          |
-- | David    | Bob      | 45000          | 60000          | -15000          |
-- | Eve      | Bob      | 40000          | 60000          | -20000          |
-- +----------+----------+----------------+----------------+----------------+

/*
6. Common Pitfalls to Avoid
---------------------------
- Forgetting to use table aliases, leading to ambiguous column references.
- Creating unintended Cartesian products by missing join conditions.
- Ignoring performance implications on large datasets.
*/

/*
7. Best Practices
------------------
- Always use table aliases for readability and to avoid ambiguity.
- Optimize indexes on columns used in join conditions.
- Use appropriate filtering conditions to minimize result set size.
*/

/*
8. Performance Considerations
-----------------------------
- Self Joins can be computationally expensive on large tables.
- Use EXPLAIN plans to analyze query performance.
- Limit the number of rows processed using filters (e.g., WHERE clauses).
*/

/*
9. Tips for Optimizing Self Join Queries
----------------------------------------
- Ensure indexes exist on columns used in join conditions.
- Avoid unnecessary columns in the SELECT clause.
- Use WHERE conditions to restrict the number of rows before joining.
*/