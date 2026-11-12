db.accounts.insertMany([
    {
        account_number: "KPD001",
        customer_code: "KPC001",
        bank_name: "KiloPay Digital Bank",
        account_type: "Savings",
        balance: NumberDecimal("250000.00"),
        currency: "NGN",
        status: "Active",
        date_opened: new Date("2026-01-15")
    },

    {
        account_number: "KPD002",
        customer_code: "KPC001",
        bank_name: "KiloPay Digital Bank",
        account_type: "Current",
        balance: NumberDecimal("500000.00"),
        currency: "NGN",
        status: "Active",
        date_opened: new Date("2026-01-20")
    },

    {
        account_number: "KPD003",
        customer_code: "KPC002",
        bank_name: "KiloPay Digital Bank",
        account_type: "Savings",
        balance: NumberDecimal("150000.00"),
        currency: "NGN",
        status: "Active",
        date_opened: new Date("2026-02-20")
    },

    {
        account_number: "KPD004",
        customer_code: "KPC003",
        bank_name: "KiloPay Digital Bank",
        account_type: "Savings",
        balance: NumberDecimal("300000.00"),
        currency: "NGN",
        status: "Active",
        date_opened: new Date("2026-03-25")
    }
]);