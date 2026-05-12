WITH customers AS (

    SELECT 
        CUSTOMER_ID,
        USERNAME,
        PASSWORD AS customer_password
    FROM {{ source('s1', 'customer') }}
    WHERE CUSTOMER_ID = 1

),

orders AS (

    SELECT
        ORDER_ID,
        ORDER_AMOUNT,
        CUSTOMER_ID,
        COUNT(*) AS number_of_orders
    FROM {{ source('s1', 'orders') }}
    GROUP BY 1,2,3

),

final AS (

    SELECT
        customers.CUSTOMER_ID,
        customers.USERNAME,
        COALESCE(orders.number_of_orders, 0) AS number_of_orders
    FROM customers
    LEFT JOIN orders 
        ON customers.customer_id = orders.customer_id

)

SELECT * 
FROM final