{% snapshot snap_ticket_status %}

{{
    config(
        schema='SBI_SCHEMA',
        database='SBI_DB',
        unique_key='id',
        strategy='check',
        check_cols=['status']
    )
}}

select * from {{ ref('m_ticket_status') }}

{% endsnapshot %}