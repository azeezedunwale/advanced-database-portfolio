-- Part A (keep open)

BEGIN;

SELECT *
FROM account
WHERE account_id = 1
FOR UPDATE;

-- Commit after Part B

COMMIT;