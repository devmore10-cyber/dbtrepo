{{ config(
    materialized='incremental',
    unique_key='TRANSACTION_ID'
) }}

SELECT
    TRANSACTION_ID,
    ACCOUNT_NO,
    AMOUNT,
    TXN_DATE
FROM {{ source('s1', 'RAW_TRANSACTIONS') }}

{% if is_incremental() %}

WHERE TXN_DATE >
(
SELECT COALESCE(MAX(TXN_DATE),'1900-01-01')
FROM {{ this }}
)

{% endif %}