
{{ config(
    materialized='incremental',
    unique_key='C_CUSTOMER_SK'
) }}

SELECT
    C_CUSTOMER_SK,
    C_CUSTOMER_ID,
    C_FIRST_NAME,
    C_LAST_NAME,
    C_EMAIL_ADDRESS,
    C_LAST_REVIEW_DATE
FROM {{ source('s1', 'TB_CUSTOMER') }}

{% if is_incremental() %}

WHERE C_LAST_REVIEW_DATE >
(
    SELECT COALESCE(MAX(C_LAST_REVIEW_DATE),'1900-01-01'::DATE)
    FROM {{ this }}
)

{% endif %}