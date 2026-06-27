{{ config(
    pre_hook="
        INSERT INTO AUDIT_LOG
        VALUES ('CUSTOMER_MODEL','STARTED',CURRENT_TIMESTAMP)
    ",
    post_hook="
        INSERT INTO AUDIT_LOG
        VALUES ('CUSTOMER_MODEL','COMPLETED',CURRENT_TIMESTAMP)
    "
) }}

SELECT *
FROM {{ source('s1','CUSTOMER') }}



