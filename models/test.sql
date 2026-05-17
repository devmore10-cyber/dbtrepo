select *
from {{ source('s1', 't_customers') }}
limit 10