select
order_id as order_id,
ORDER_AMOUNT as ORDER_AMOUNT,
CUSTOMER_ID

from {{ source('s1', 'orders') }}