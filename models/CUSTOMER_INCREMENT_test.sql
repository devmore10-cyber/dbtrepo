{{ config(
    materialized='incremental',
    unique_key='C_CUSTOMER_SK'
) }}

SELECT
    c.C_CUSTOMER_SK,
    c.C_CUSTOMER_ID,
    c.UPDATED_DATE
FROM {{ source('s1', 'TB_CUSTOMER') }} c

{% if is_incremental() %}

WHERE c.UPDATED_DATE >
(
    SELECT COALESCE(
        MAX(t.UPDATED_DATE),
        '1900-01-01'::DATE
    )
    FROM {{ this }} t
)

{% endif %}