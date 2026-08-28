{% snapshot customer_snapshot %}

{{
config(
target_schema='SBI_SCHEMA',

unique_key='C_CUSTOMER_SK',

strategy='check',

check_cols=[
'C_EMAIL_ADDRESS',
'C_CURRENT_ADDR_SK',
'C_LOGIN'

]
)
}}

SELECT
C_CUSTOMER_SK,
C_CUSTOMER_ID,
C_FIRST_NAME,
C_LAST_NAME,
C_EMAIL_ADDRESS,
C_CURRENT_ADDR_SK,
C_LOGIN,
START_DATE,
END_DATE,
IS_CURRENT
FROM {{ source('s1','DIM_CUSTOMER_HISTORY') }}

{% endsnapshot %}