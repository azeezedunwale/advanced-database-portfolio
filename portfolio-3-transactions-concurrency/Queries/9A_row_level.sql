-- Part B
BEGIN;

UPDATE account
SET balance = balance - 500
WHERE account_id = 1;

-- Commit after Part A Commit

COMMIT;