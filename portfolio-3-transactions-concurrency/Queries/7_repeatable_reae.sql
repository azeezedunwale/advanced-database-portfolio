-- Section A

BEGIN TRANSACTION 
ISOLATION LEVEL REPEATABLE READ;

SELECT balance
FROM account
WHERE account_id = 1; 

--Section B

BEGIN;

UPDATE account
SET balance = balance + 5000
WHERE account_id = 1;

COMMIT;

-- Section A
SELECT balance
FROM account
WHERE account_id = 1;

COMMIT;