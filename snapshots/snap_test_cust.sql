{% snapshot snap_test_custno_check %}

{{
    config(
        target_schema='SBI_SCHEMA',
        target_database='SBI_DB',
        unique_key='CUSTOMER_ID',
        strategy='timestamp',
        updated_at='UPDATED_AT',
        invalidate_hard_deletes=False
    )
}}

SELECT *
FROM {{ source('s1', 't_test_custo') }}

{% endsnapshot %}