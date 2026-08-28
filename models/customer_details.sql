SELECT
    C_CUSTOMER_SK,
    C_CUSTOMER_ID,
   
   {{ get_customer('C_CUSTOMER_SK', 'C_CUSTOMER_ID') }} AS CUSTOMER_KEY
  -- {{get_customer}}

FROM {{ source('s1', 'TB_CUSTOMER') }}