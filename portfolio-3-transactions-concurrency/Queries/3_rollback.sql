-- Demonstrating ROLLBACK

BEGIN;

-- update account balance

UPDATE account
SET balance = balance + 700
WHERE account_id = 2;

-- Check the temporary change
SELECT account_id, account_number, balance
FROM account
WHERE account_id = 2;

-- Cancel the transaction
ROLLBACK;

-- Verify that the balance is unchanged
SELECT account_id, account_number, balance
FROM account
WHERE account_id = 2;