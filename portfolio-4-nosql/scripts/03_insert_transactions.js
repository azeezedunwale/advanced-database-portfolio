db.transactions.insertMany([
    {
        transaction_reference: "KPT001",
        account_number: "KPD001",
        customer_code: "KPC001",
        transaction_type: "Transfer",
        amount: NumberDecimal("20000.00"),
        currency: "NGN",
        transaction_date: new Date("2026-10-01"),
        status: "Successful",
        metadata: {
            channel: "Mobile App",
            device: "iPhone",
            location: "Lagos",
            narration: "Transfer to beneficiary"
        }
    },

    {
        transaction_reference: "KPT002",
        account_number: "KPD001",
        customer_code: "KPC001",
        transaction_type: "Deposit",
        amount: NumberDecimal("50000.00"),
        currency: "NGN",
        transaction_date: new Date("2026-10-02"),
        status: "Successful",
        metadata: {
            channel: "Agent Banking",
            agent_id: "AG001",
            location: "Ikeja"
        }
    },

    {
        transaction_reference: "KPT003",
        account_number: "KPD002",
        customer_code: "KPC001",
        transaction_type: "Withdrawal",
        amount: NumberDecimal("10000.00"),
        currency: "NGN",
        transaction_date: new Date("2026-10-03"),
        status: "Failed",
        metadata: {
            channel: "ATM",
            terminal_id: "ATM001",
            location: "Victoria Island"
        }
    },

    {
        transaction_reference: "KPT004",
        account_number: "KPD003",
        customer_code: "KPC002",
        transaction_type: "Transfer",
        amount: NumberDecimal("15000.00"),
        currency: "NGN",
        transaction_date: new Date("2026-10-04"),
        status: "Successful",
        metadata: {
            channel: "Mobile App",
            device: "Android",
            location: "Abuja"
        }
    },

    {
        transaction_reference: "KPT005",
        account_number: "KPD004",
        customer_code: "KPC003",
        transaction_type: "Payment",
        amount: NumberDecimal("8000.00"),
        currency: "NGN",
        transaction_date: new Date("2026-10-05"),
        status: "Pending",
        metadata: {
            channel: "Web",
            merchant: "Utility Provider",
            location: "Kano"
        }
    }
]);