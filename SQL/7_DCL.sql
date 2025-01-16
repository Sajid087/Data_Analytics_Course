/*
====================================
1. Definition and Purpose of DCL
====================================
Data Control Language (DCL) in SQL is used to control access to the database by managing permissions and privileges.
DCL commands ensure that the database is secure and only authorized users can perform specific actions.

Key purposes of DCL:
- Granting and revoking permissions to/from users.
- Managing database roles and privileges.
- Enhancing database security and ensuring data confidentiality.
*/

/*
====================================
2. Key DCL Commands
====================================
1. GRANT: Provides specific permissions to users or roles.
2. REVOKE: Removes specific permissions from users or roles.
*/

/*
====================================
3. GRANT Command
====================================
Purpose: Assigns permissions to a user or role to perform certain actions on database objects.

Syntax:
GRANT privilege_type ON object_name TO user_name [WITH GRANT OPTION];

Components:
- privilege_type: The type of privilege (e.g., SELECT, INSERT, UPDATE, DELETE).
- object_name: The database object (e.g., table, view, schema).
- user_name: The user or role to whom the privilege is granted.
- WITH GRANT OPTION: Allows the user to grant the same privilege to others.
*/

-- Example: Grant SELECT and INSERT permissions on the "employees" table to user "john_doe"
GRANT SELECT, INSERT ON employees TO john_doe;

-- Example: Grant ALL privileges on the "sales" schema to role "sales_manager" with the ability to grant them further
GRANT ALL PRIVILEGES ON SCHEMA sales TO sales_manager WITH GRANT OPTION;

/*
====================================
4. REVOKE Command
====================================
Purpose: Removes previously granted permissions from a user or role.

Syntax:
REVOKE privilege_type ON object_name FROM user_name;

Components:
- privilege_type: The type of privilege to be revoked.
- object_name: The database object from which the privilege is being revoked.
- user_name: The user or role from whom the privilege is revoked.
*/

-- Example: Revoke INSERT permission on the "employees" table from user "john_doe"
REVOKE INSERT ON employees FROM john_doe;

-- Example: Revoke all privileges on the "sales" schema from role "sales_manager"
REVOKE ALL PRIVILEGES ON SCHEMA sales FROM sales_manager;

/*
====================================
5. Real-World Usage Scenarios
====================================
1. Assigning access to specific tables for reporting users.
2. Restricting data modification permissions for certain roles.
3. Enforcing principle of least privilege by granting minimal access.
4. Allowing administrators to manage user permissions.
*/

-- Example: Granting read-only access to reporting users
GRANT SELECT ON employees TO reporting_user;

-- Example: Revoking UPDATE permission from a junior role
REVOKE UPDATE ON orders FROM junior_staff;

/*
====================================
6. Security Implications
====================================
1. Protects sensitive data by restricting access.
2. Ensures that only authorized users can modify or view data.
3. Helps prevent unauthorized actions and data breaches.
*/

/*
====================================
7. Best Practices for Using DCL
====================================
1. Follow the principle of least privilege by granting minimal permissions.
2. Regularly review and audit granted permissions.
3. Use roles to manage permissions instead of individual users.
4. Document changes in permissions for accountability.
5. Avoid using WITH GRANT OPTION unless absolutely necessary.
*/

-- Example: Creating and using roles for access control
CREATE ROLE data_analyst;
GRANT SELECT ON employees TO data_analyst;
GRANT SELECT ON sales TO data_analyst;

-- Assigning the role to a user
GRANT data_analyst TO alice;

/*
====================================
8. Common Pitfalls to Avoid
====================================
1. Granting excessive privileges to users without proper review.
2. Forgetting to revoke permissions when no longer needed.
3. Using WITH GRANT OPTION carelessly, leading to privilege escalation.
*/