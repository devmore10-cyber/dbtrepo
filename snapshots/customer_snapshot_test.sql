{% snapshot customer_snapshot_test %}
    {{
        config(
            target_schema='SBI_SCHEMA',
            target_database='SBI_DB',
            unique_key='C_CUSTOMER_SK',
            strategy='timestamp',
            updated_at='UPDATED_DATE'
        )
    }}
SELECT
    C_CUSTOMER_SK,
    C_CUSTOMER_ID,
    C_EMAIL_ADDRESS,
    UPDATED_DATE

    select * from {{ source('s1', 'TB_CUSTOMER') }}
 {% endsnapshot %}