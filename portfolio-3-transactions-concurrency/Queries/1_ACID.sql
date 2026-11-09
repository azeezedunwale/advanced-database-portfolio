-- To show the original balance
SELECT
    account_id,
    account_number,
    balance
FROM account
WHERE account_id = 1;

-- Increase balance by 1000
UPDATE account
SET balance = balance + 1000
WHERE account_id = 1;

-- Display the updated balance within the transaction
SELECT
    account_id,
    account_number,
    balance
FROM account
WHERE account_id = 1;

-- Undo the demonstration update
ROLLBACK;

-- Confirm that the original balance is restored
SELECT
    account_id,
    account_number,
    balance
FROM account
WHERE account_id = 1;