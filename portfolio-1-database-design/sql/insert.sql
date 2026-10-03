INSERT INTO bank (bank_name, bank_code)
VALUES
('Access Bank', '044'),
('First Bank of Nigeria', '011'),
('GT Bank', '058'),
('United Bank for Africa', '033'),
('Zenith Bank', '057');

INSERT INTO customer
(first_name, last_name, email, phone, date_of_birth, address)
VALUES
('Adebayo', 'William', 'adebayo.willians@example.com',
 '08020000001', '1982-05-12',
 'Ikeja, Lagos'),

('Kadijat', 'Adeoye', 'kadijat.adeoye@example.com',
 '08020000002', '1989-08-20',
 'Sokoto, Nigeria'),

('Kenneth', 'Onuora', 'kenneth.onuora@example.com',
 '08020000003', '1985-03-15',
 'Abia, Nigeria'),

('Ngozi', 'Ajala', 'ngozi.ajala@example.com',
 '08020000004', '1991-11-09',
 'Lagos, Nigeria'),

('Ojugbele', 'Ibrahim', 'ojugbele.ibrahim@example.com',
 '08020000005', '1984-07-25',
 'Abuja, Nigeria'),
 ('Soji', 'Adeosun', 'soji.adeosun@example.com',
 '08020000006', '1987-07-25',
 'Osun, Nigeria'),
 ('Boluwatife', 'Adegbemi', 'boluwatife.adegbemi@example.com',
 '08020000007', '1996-07-25',
 'Ogun, Nigeria');

 INSERT INTO account
(customer_id, bank_id, account_number, account_type, balance)
VALUES
(1, 1, '1000000001', 'Savings', 250000.00),

(2, 2, '1000000002', 'Current', 500000.00),

(3, 3, '1000000003', 'Savings', 175000.00),

(4, 4, '1000000004', 'Savings', 320000.00),

(5, 5, '1000000005', 'Current', 750000.00),
(6, 1, '1000000006', 'Current', 350000.00),
(7, 2, '1000000007', 'Savings', 450000.00);

INSERT INTO beneficiary
(customer_id, bank_id, beneficiary_name, account_number, nickname)
VALUES
(1, 2, 'Kadijat Adeoye', '2000000001', 'Kadijat'),

(1, 3, 'Kenneth Onuora', '2000000002', 'Kenneth'),

(2, 1, 'Adebayo Williams', '1000000001', 'Adebayo'),

(3, 4, 'Ngozi Ajala', '1000000004', 'Ngozi'),
(5, 5, 'Soji Adeosun', '1000000005', 'Azeez');

INSERT INTO financial_transaction
(account_id, transaction_type, amount,
 transaction_reference, description, status)
VALUES

(1, 'Deposit', 300000.00,
 'DEP-000001',
 'Initial account funding',
 'Successful'),

(1, 'Withdrawal', 50000.00,
 'WDL-000001',
 'ATM withdrawal',
 'Successful'),

(2, 'Deposit', 600000.00,
 'DEP-000002',
 'Salary deposit',
 'Successful'),

(3, 'Transfer', 25000.00,
 'TRF-000001',
 'Transfer to beneficiary',
 'Successful'),

(4, 'Deposit', 350000.00,
 'DEP-000003',
 'Account funding',
 'Successful'),

(5, 'Transfer', 100000.00,
 'TRF-000002',
 'Business payment',
 'Successful');

 INSERT INTO user_account
(username, full_name, role, email)
VALUES
('admin01', 'System Administrator',
 'Administrator', 'admin@kilopay.example.com'),

('finance01', 'Finance Officer',
 'Finance Officer', 'finance@kilopay.example.com'),

('compliance01', 'Compliance Officer',
 'Compliance Officer', 'compliance@kilopay.example.com');

 INSERT INTO audit_log
(user_id, action, table_name, record_id, description)
VALUES
(1, 'CREATE', 'customer', 1,
 'Customer account created'),

(2, 'UPDATE', 'account', 1,
 'Account balance updated'),

(3, 'REVIEW', 'financial_transaction', 1,
 'Transaction reviewed for compliance');