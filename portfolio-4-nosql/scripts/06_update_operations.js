db.customers.updateOne(
    {
        customer_code: "KPC001"
    },

    {
        $set: {
            phone: "08039999999"
        }
    }
);
