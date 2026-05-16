SELECT 
    *
FROM {{ source('s1', 't_customers') }}
