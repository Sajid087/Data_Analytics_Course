/*
============================================
1. Introduction to SQL Joins
============================================
SQL Joins are used to combine rows from two or more tables based on a related column between them.
They enable querying across multiple tables in relational databases, allowing users to extract meaningful insights.
Common types of joins include INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, and CROSS JOIN.
*/

/*
============================================
2. What is a Cross Join?
============================================
A Cross Join (or Cartesian Join) returns the Cartesian product of two tables. This means every row from the first table is
combined with every row from the second table.
- If Table A has 'm' rows and Table B has 'n' rows, the result of a Cross Join will have 'm * n' rows.
- A Cross Join does not require any condition.

Syntax:
SELECT column_list
FROM table1
CROSS JOIN table2;
*/

/*
============================================
3. When to Use Cross Join
============================================
- Generating all possible combinations of rows from two tables.
- Creating test datasets for analysis.
- Useful in scenarios involving pairing or permutations of data.

Potential Use Cases:
- Creating a schedule where every employee is paired with every available shift.
- Matching all customers to every promotional offer.
*/

/*
============================================
4. Mathematical Concept Behind Cross Join
============================================
The Cross Join implements the Cartesian product in mathematics:
- For two sets A and B, the Cartesian product is defined as: A x B = {(a, b) | a \u2208 A, b \u2208 B}.
*/

/*
============================================
5. Syntax and Structure of Cross Join
============================================
SELECT column_list
FROM table1
CROSS JOIN table2;
*/

-- Example 1: Basic Cross Join Syntax
-- Suppose we have two tables:
-- Table: products
-- +----+-------------+
-- | id | product_name|
-- +----+-------------+
-- |  1 | Laptop      |
-- |  2 | Smartphone  |
-- +----+-------------+

-- Table: regions
-- +----+---------+
-- | id | region  |
-- +----+---------+
-- |  1 | North   |
-- |  2 | South   |
-- +----+---------+

SELECT products.product_name, regions.region
FROM products
CROSS JOIN regions;

/*
Expected Output:
+-------------+---------+
| product_name| region  |
+-------------+---------+
| Laptop      | North   |
| Laptop      | South   |
| Smartphone  | North   |
| Smartphone  | South   |
+-------------+---------+
*/

/*
============================================
6. Cross Join with WHERE Clause
============================================
A WHERE clause can be added to a Cross Join to filter the Cartesian product and return specific rows.
*/

-- Example 2: Cross Join with WHERE Clause
SELECT products.product_name, regions.region
FROM products
CROSS JOIN regions
WHERE regions.region = 'North';

/*
Expected Output:
+-------------+---------+
| product_name| region  |
+-------------+---------+
| Laptop      | North   |
| Smartphone  | North   |
+-------------+---------+
*/

/*
============================================
7. Cross Join with Multiple Tables
============================================
Cross Join can also be applied to more than two tables.
*/

-- Example 3: Cross Join with Multiple Tables
-- Table: sales
-- +----+-------+
-- | id | amount|
-- +----+-------+
-- |  1 | 100   |
-- |  2 | 200   |
-- +----+-------+

SELECT products.product_name, regions.region, sales.amount
FROM products
CROSS JOIN regions
CROSS JOIN sales;

/*
Expected Output:
+-------------+---------+--------+
| product_name| region  | amount |
+-------------+---------+--------+
| Laptop      | North   | 100    |
| Laptop      | North   | 200    |
| Laptop      | South   | 100    |
| Laptop      | South   | 200    |
| Smartphone  | North   | 100    |
| Smartphone  | North   | 200    |
| Smartphone  | South   | 100    |
| Smartphone  | South   | 200    |
+-------------+---------+--------+
*/

/*
============================================
8. Performance Implications and Considerations
============================================
- Cross Join can produce a very large number of rows, especially if both tables contain many rows.
- Use cautiously and ensure that the resulting data size is manageable.
- Apply filtering conditions (WHERE clause) to reduce the size of the Cartesian product.
- Avoid Cross Joins in production environments unless absolutely necessary.
*/

/*
============================================
9. Common Pitfalls to Avoid
============================================
- Using Cross Join unintentionally due to missing join conditions in other types of joins.
- Overloading the database with massive Cartesian products.
*/

/*
============================================
10. Best Practices
============================================
- Always verify the use case before applying a Cross Join.
- Limit the number of rows in participating tables for better performance.
- Use appropriate filtering with WHERE clause to manage output size.
*/