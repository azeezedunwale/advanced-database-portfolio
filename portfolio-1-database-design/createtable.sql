CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    date_of_birth DATE,
    address VARCHAR(200),
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',
    
    CONSTRAINT chk_customer_status
        CHECK (status IN ('Active', 'Inactive', 'Suspended'))
);

CREATE TABLE bank (
    bank_id SERIAL PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL,
    bank_code VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    
    customer_id INT NOT NULL,
    bank_id INT NOT NULL,
    
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance NUMERIC(15,2) NOT NULL DEFAULT 0,
    currency VARCHAR(3) NOT NULL DEFAULT 'NGN',
    status VARCHAR(20) NOT NULL DEFAULT 'Active',
    date_opened DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id),

    CONSTRAINT fk_account_bank
        FOREIGN KEY (bank_id)
        REFERENCES bank(bank_id),

    CONSTRAINT chk_account_balance
        CHECK (balance >= 0),

    CONSTRAINT chk_account_type
        CHECK (account_type IN ('Savings', 'Current')),

    CONSTRAINT chk_account_status
        CHECK (status IN ('Active', 'Inactive', 'Blocked'))
);

CREATE TABLE beneficiary (
    beneficiary_id SERIAL PRIMARY KEY,

    customer_id INT NOT NULL,
    bank_id INT NOT NULL,

    beneficiary_name VARCHAR(100) NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    nickname VARCHAR(50),
    date_added DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',

    CONSTRAINT fk_beneficiary_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id),

    CONSTRAINT fk_beneficiary_bank
        FOREIGN KEY (bank_id)
        REFERENCES bank(bank_id),

    CONSTRAINT chk_beneficiary_status
        CHECK (status IN ('Active', 'Inactive'))
);

CREATE TABLE financial_transaction (
    transaction_id SERIAL PRIMARY KEY,

    account_id INT NOT NULL,

    transaction_type VARCHAR(20) NOT NULL,
    amount NUMERIC(15,2) NOT NULL,
    transaction_reference VARCHAR(50) UNIQUE NOT NULL,
    transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    status VARCHAR(20) NOT NULL DEFAULT 'Successful',

    CONSTRAINT fk_transaction_account
        FOREIGN KEY (account_id)
        REFERENCES account(account_id),

    CONSTRAINT chk_transaction_amount
        CHECK (amount > 0),

    CONSTRAINT chk_transaction_type
        CHECK (
            transaction_type IN
            ('Deposit', 'Withdrawal', 'Transfer')
        ),

    CONSTRAINT chk_transaction_status
        CHECK (
            status IN
            ('Successful', 'Pending', 'Failed', 'Reversed')
        )
);

CREATE TABLE user_account (
    user_id SERIAL PRIMARY KEY,

    username VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(30) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_user_role
        CHECK (
            role IN
            ('Administrator', 'Finance Officer',
             'Compliance Officer', 'Customer Service')
        ),

    CONSTRAINT chk_user_status
        CHECK (status IN ('Active', 'Inactive'))
);

CREATE TABLE audit_log (
    audit_id SERIAL PRIMARY KEY,

    user_id INT NOT NULL,

    action VARCHAR(100) NOT NULL,
    table_name VARCHAR(100) NOT NULL,
    record_id INT,
    action_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description TEXT,

    CONSTRAINT fk_audit_user
        FOREIGN KEY (user_id)
        REFERENCES user_account(user_id)
);