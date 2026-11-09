-- Baseline (before optimisation)
EXPLAIN ANALYZE
SELECT *
FROM financial_transaction
WHERE account_id = 3;

-- create index on financila transaction

CREATE INDEX idx_financial_transaction_account
ON financial_transaction(account_id);

-- To know that the index exist

SELECT
    indexname,
    indexdef
FROM pg_indexes
WHERE tablename = 'financial_transaction';

-- ANALYZE
ANALYZE financial_transaction;

-- Performance after optimization
EXPLAIN ANALYZE
SELECT *
FROM financial_transaction
WHERE account_id = 3;

-- create index on account_id and transaction_date (optimization 2)

CREATE INDEX idx_financial_transaction_account_date
ON financial_transaction(account_id, transaction_date);

ANALYZE financial_transaction;

-- Analyzis after optimization 2
EXPLAIN ANALYZE
SELECT
    transaction_id,
    transaction_type,
    amount,
    transaction_date,
    status
FROM financial_transaction
WHERE account_id = 3
AND transaction_date >= CURRENT_TIMESTAMP - INTERVAL '30 days'
ORDER BY transaction_date DESC;

-- foreign keyindex for customer account look up

CREATE INDEX idx_account_customer
ON account(customer_id);

-- Analyze after optimization 3
EXPLAIN ANALYZE
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id
WHERE c.customer_id = 3;

-- Report
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(ft.transaction_id) AS transaction_count,
    SUM(ft.amount) AS total_transaction_value
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id
JOIN financial_transaction ft
    ON a.account_id = ft.account_id
WHERE ft.status = 'Successful'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transaction_value DESC;

-- Analyze before optimization
EXPLAIN ANALYZE
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(ft.transaction_id) AS transaction_count,
    SUM(ft.amount) AS total_transaction_value
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id
JOIN financial_transaction ft
    ON a.account_id = ft.account_id
WHERE ft.status = 'Successful'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transaction_value DESC;

-- Optimizing  reporting
CREATE INDEX idx_ft_account_status

-- Analyze after optimization

EXPLAIN ANALYZE
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(ft.transaction_id) AS transaction_count,
    SUM(ft.amount) AS total_transaction_value
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id
JOIN financial_transaction ft
    ON a.account_id = ft.account_id
WHERE ft.status = 'Successful'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transaction_value DESC;
