SELECT 
    CUSTOMER_ID,
    USERNAME,
    PASSWORD AS customer_password
FROM {{ source('s1', 'customer') }}
WHERE CUSTOMER_ID = 1