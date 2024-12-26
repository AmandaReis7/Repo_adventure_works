with
    dim_cartao as (
        select *
        from {{ref('int_adw__cartao_clientes')}}
    )     
select * 
from dim_cartao
