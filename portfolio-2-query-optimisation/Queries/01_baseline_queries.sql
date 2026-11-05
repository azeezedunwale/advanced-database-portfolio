-- customer information retrieval
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    status
FROM customer;

-- Customer and account table
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type,
    a.balance,
    a.status
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id;
	
-- Relationshipt between custmer table, account table, and bank table
SELECT
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type,
    a.balance,
    b.bank_name
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id
JOIN bank b
    ON a.bank_id = b.bank_id;

-- Transaction history
SELECT
    ft.transaction_id,
    a.account_number,
    ft.transaction_type,
    ft.amount,
    ft.transaction_reference,
    ft.transaction_date,
    ft.status
FROM financial_transaction ft
JOIN account a
    ON ft.account_id = a.account_id
ORDER BY ft.transaction_date DESC;

-- Large Transaction
SELECT
    transaction_id,
    account_id,
    transaction_type,
    amount,
    transaction_date,
    status
FROM financial_transaction
WHERE amount >= 100000
ORDER BY amount DESC;

-- Transaction summary
SELECT
    account_id,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount
FROM financial_transaction
GROUP BY account_id
ORDER BY total_amount DESC;

-- successful category tranx
SELECT
    transaction_type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM financial_transaction
WHERE status = 'Successful'
GROUP BY transaction_type
ORDER BY total_amount DESC;

-- Tranx summary (custometrs)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(ft.transaction_id) AS transaction_count,
    COALESCE(SUM(ft.amount), 0) AS total_transaction_value
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id
LEFT JOIN financial_transaction ft
    ON a.account_id = ft.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transaction_value DESC;