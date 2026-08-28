{% macro customer_risk(C_BIRTH_COUNTRY) %}

case 
    when {{C_BIRTH_COUNTRY}} in ('TOGO','SAN','MARINO','FIJI','NAMIBIA')
    then 'High'
else 'Normal'
    end
    
{% endmacro %}