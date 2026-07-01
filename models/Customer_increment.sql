{{ config(
    materialized='incremental',
    unique_key='ID'
) }}

SELECT
    ID,
    FIRSTNAME,
    LASTNAME,
    EMAIL,
    CITY,
    UPDATED_DATE
FROM {{ source('s1', 'CUSTOMER') }}

{% if is_incremental() %}

WHERE UPDATED_DATE >
(
    SELECT COALESCE(MAX(UPDATED_DATE), '1900-01-01'::TIMESTAMP)
    FROM {{ this }}
)

{% endif %}