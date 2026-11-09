BEGIN TRANSACTION
ISOLATION LEVEL READ COMMITTED;

--Section A
SELECT balance
FROM account
WHERE account_id = 1;

-- Section A read the original balance

-- Section B with commit
BEGIN;

UPDATE account
SET balance = balance + 2000
WHERE account_id = 1;

COMMIT;


--Section A
SELECT balance
FROM account
WHERE account_id = 1;
-- Section A reads the updated balance after section B commit

COMMIT;