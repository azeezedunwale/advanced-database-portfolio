db.customers.insertMany([
    {
        customer_code: "KPC001",
        first_name: "Azeez",
        last_name: "Edunwale",
        email: "azeez@example.com",
        phone: "08030000001",

        address: {
            city: "Lagos",
            state: "Lagos",
            country: "Nigeria"
        },

        preferences: {
            notification_email: true,
            notification_sms: true,
            preferred_language: "English"
        },

        status: "Active",
        created_at: new Date("2026-01-10")
    },

    {
        customer_code: "KPC002",
        first_name: "Chinedu",
        last_name: "Okafor",
        email: "chinedu@example.com",
        phone: "08030000002",

        address: {
            city: "Abuja",
            state: "FCT",
            country: "Nigeria"
        },

        preferences: {
            notification_email: true,
            notification_sms: false,
            preferred_language: "English"
        },

        status: "Active",
        created_at: new Date("2026-02-15")
    },

    {
        customer_code: "KPC003",
        first_name: "Fatima",
        last_name: "Bello",
        email: "fatima@example.com",
        phone: "08030000003",

        address: {
            city: "Kano",
            state: "Kano",
            country: "Nigeria"
        },

        preferences: {
            notification_email: false,
            notification_sms: true,
            preferred_language: "English"
        },

        status: "Active",
        created_at: new Date("2026-03-20")
    }
]);


