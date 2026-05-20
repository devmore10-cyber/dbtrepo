{% snapshot snap_test_chek %}

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
FROM {{ source('s1', 'T_TEST_CUSTO') }}

{% endsnapshot %}