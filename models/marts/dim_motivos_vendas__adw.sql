with
    dim_motivos_vendas as (
        select *
        from {{ref('int_adw__motivos_vendas')}}
    )     
select * 
from dim_motivos_vendas