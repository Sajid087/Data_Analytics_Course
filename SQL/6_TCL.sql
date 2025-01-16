/*
====================================
1. Definition and Purpose of TCL
====================================
Transaction Control Language (TCL) in SQL is used to manage transactions in a database.
Transactions are sequences of one or more SQL statements that are executed as a single unit of work.

Key purposes of TCL:
- Ensures data consistency and integrity.
- Manages changes made by DML commands (INSERT, UPDATE, DELETE).
- Allows for recovery from errors using rollback mechanisms.
*/

/*
====================================
2. Key TCL Commands
====================================
1. COMMIT: Saves all changes made during the transaction permanently to the database.
2. ROLLBACK: Reverts all changes made during the current transaction.
3. SAVEPOINT: Creates a point within a transaction to which you can later rollback.
4. SET TRANSACTION: Sets transaction properties such as isolation level.
*/

/*
====================================
3. Transaction Properties (ACID Principles)
====================================
ACID properties ensure reliable processing of database transactions:
- Atomicity: A transaction is all or nothing.
- Consistency: A transaction transforms the database from one valid state to another.
- Isolation: Transactions occur independently of one another.
- Durability: Once a transaction is committed, changes are permanent.
*/

/*
====================================
4. Transaction States
====================================
1. Active: The transaction is ongoing and has not yet been completed.
2. Partially Committed: All statements have executed, but changes are not yet permanent.
3. Committed: Changes are permanently saved.
4. Failed: An error occurred, and the transaction cannot proceed.
5. Aborted: The transaction has been rolled back to its previous state.
*/

/*
====================================
5. Practical Examples of TCL Commands
====================================
*/

-- Example Database Schema
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts (account_id, account_holder, balance)
VALUES
(1, 'Alice', 1000.00),
(2, 'Bob', 500.00);

/*
------------------------------------
COMMIT Command
------------------------------------
Purpose: Saves changes made during the transaction.
*/
-- Example: COMMIT
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 100
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE account_id = 2;

COMMIT; -- Changes are now permanent

/*
------------------------------------
ROLLBACK Command
------------------------------------
Purpose: Reverts changes made during the transaction.
*/
-- Example: ROLLBACK
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 200
WHERE account_id = 1;

-- Simulate an error (e.g., insufficient balance)
ROLLBACK; -- Reverts all changes made during the transaction

/*
------------------------------------
SAVEPOINT Command
------------------------------------
Purpose: Creates a point in a transaction to which you can later rollback.
*/
-- Example: SAVEPOINT
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 50
WHERE account_id = 1;

SAVEPOINT sp1; -- Savepoint created

UPDATE accounts
SET balance = balance + 50
WHERE account_id = 2;

ROLLBACK TO sp1; -- Reverts to the savepoint, keeping changes before it
COMMIT; -- Finalize the remaining changes

/*
------------------------------------
SET TRANSACTION Command
------------------------------------
Purpose: Sets properties for the transaction, such as isolation level.
*/
-- Example: SET TRANSACTION
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 100
WHERE account_id = 1;

COMMIT; -- Ensures strict isolation during the transaction

/*
====================================
6. Best Practices for Using TCL
====================================
- Use transactions for operations that require multiple DML commands to ensure consistency.
- Always use COMMIT or ROLLBACK to end a transaction explicitly.
- Use SAVEPOINTs for partial rollbacks in complex transactions.
- Set appropriate isolation levels to balance concurrency and consistency.
*/

/*
====================================
7. Common Pitfalls to Avoid
====================================
- Forgetting to commit or rollback, leaving the transaction open.
- Using too many savepoints, leading to confusion and potential errors.
- Holding transactions open for long durations, which can cause performance issues.
- Not setting an appropriate isolation level, leading to issues like dirty reads or phantom reads.
*/

/*
====================================
8. Real-World Scenarios
====================================
1. Banking Systems: Ensuring consistency during fund transfers.
2. Inventory Management: Maintaining accurate stock levels during sales transactions.
3. Reservation Systems: Handling simultaneous bookings without conflicts.
*/

-- Example: Fund Transfer in a Banking System
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1; -- Deduct from Alice

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2; -- Add to Bob

COMMIT; -- Ensure the transaction completes successfully

/*
====================================
9. Interaction with Other SQL Command Categories
====================================
- DDL: Often triggers implicit commits, ending the transaction.
- DML: Works within transactions to manipulate data.
- DCL: Can be used to grant/revoke permissions needed for transaction operations.
*/