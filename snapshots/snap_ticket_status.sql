{% snapshot snapshot_name %}
    {{
        config(
            target_schema='DBT_SCHEMA',
            target_database='SBI_DB',
            unique_key='field',
            strategy='timestamp',
            invalidate_hard_deletes=False,
            updated_at='updated_at_field'
        )
    }}

    select * from {{ source('S1', 'm_ticket_status') }}
 {% endsnapshot %}