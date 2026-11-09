-- Demonstrating SAVEPOINT

BEGIN;

-- First update
UPDATE account
SET balance = balance + 5000
WHERE account_id = 1;

-- Create savepoint
SAVEPOINT first_operation_completed;

-- Second update
UPDATE account
SET balance = balance + 3000
WHERE account_id = 1;

-- Create send savepoint
SAVEPOINT second_operation_completed;

-- Third update
UPDATE account
SET balance = balance + 2000
WHERE account_id = 1;

-- check the temporary balance
SELECT account_id, balance
FROM account
WHERE account_id = 1;

-- Undo only the third operation
ROLLBACK TO SAVEPOINT second_operation_completed;

-- Check the balance after partial rollback
SELECT account_id, balance
FROM account
WHERE account_id = 1;

-- Save the first and second operations
COMMIT;