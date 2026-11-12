db.audit_logs.insertMany([
    {
        log_reference: "AUD001",
        user_id: "USR001",
        action: "LOGIN",
        activity: "User logged into mobile application",
        timestamp: new Date("2026-10-01"),
        status: "Successful"
    },

    {
        log_reference: "AUD002",
        user_id: "USR002",
        action: "TRANSFER",
        activity: "Transfer initiated",
        timestamp: new Date("2026-10-02"),
        status: "Successful"
    },

    {
        log_reference: "AUD003",
        user_id: "USR003",
        action: "PASSWORD_CHANGE",
        activity: "Password change requested",
        timestamp: new Date("2026-10-03"),
        status: "Successful"
    }
]);