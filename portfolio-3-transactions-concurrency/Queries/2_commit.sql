-- Demonstrating COMMIT


BEGIN;

-- Update account_id 2

UPDATE account
SET balance = balance + 1500
WHERE account_id = 2;

-- Check the updated balance
SELECT account_id, account_number, balance
FROM account
WHERE account_id = 2;

-- Permanently save the change
COMMIT;

-- Verify the committed balance
SELECT account_id, account_number, balance
FROM account
WHERE account_id = 2;