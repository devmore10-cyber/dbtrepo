{% macro get_customer(C_CUSTOMER_SK, C_CUSTOMER_ID) %}

    concat({{ C_CUSTOMER_SK }}, ' ', {{ C_CUSTOMER_ID }})

{% endmacro %}
