SELECT
     C_CUSTOMER_SK,
    C_CUSTOMER_ID,
    {{ customer_risk ('C_BIRTH_COUNTRY')}} as risk_level
   

    FROM {{ source('s1', 'TB_CUSTOMER') }}