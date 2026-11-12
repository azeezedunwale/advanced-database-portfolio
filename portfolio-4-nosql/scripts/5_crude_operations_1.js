db.customers.insertOne({
    customer_code: "KPC004",
    first_name: "Tunde",
    last_name: "Adeyemi",
    email: "tunde@example.com",
    phone: "08030000004",

    address: {
        city: "Ibadan",
        state: "Oyo",
        country: "Nigeria"
    },

    status: "Active",
    created_at: new Date()
});