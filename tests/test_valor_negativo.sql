{{ config (
        severity = 'error'
    )
}}

with
    negative_value as (
        select 
             valor_liquido
        from {{ ref('int_adw__vendas') }} 
    )
 select *
from negative_value
where valor_liquido < 0