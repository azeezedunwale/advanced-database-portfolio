SELECT *
FROM customer;

SELECT *
FROM bank;

SELECT *
FROM account;

SELECT *
FROM financial_transaction;

SELECT
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type,
    a.balance
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id;

SELECT
    c.first_name,
    c.last_name,
    a.account_number,
    b.bank_name,
    a.balance
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id
JOIN bank b
    ON a.bank_id = b.bank_id;

INSERT INTO account
(customer_id, bank_id, account_number, account_type, balance)
VALUES
(999, 1, '9999999999', 'Savings', 10000);

INSERT INTO account
(customer_id, bank_id, account_number, account_type, balance)
VALUES
(1, 1, '9999999998', 'Savings', -5000);