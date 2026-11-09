-- Part A (is kept opened)
BEGIN TRANSACTION
ISOLATION LEVEL SERIALIZABLE;

SELECT SUM(balance)
FROM account;


-- Part B

BEGIN TRANSACTION
ISOLATION LEVEL SERIALIZABLE;

SELECT SUM(balance)
FROM account;

-- Make a change and commit.
UPDATE account
SET balance = balance + 500
WHERE account_id = 2;

COMMIT;

-- Part A (closed)
UPDATE concurrency_demo_account
SET balance = balance + 300
WHERE account_id = 1;

COMMIT;