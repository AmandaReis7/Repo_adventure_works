with
    dim_funcionarios as (
        select *
        from {{ref('int_adw__funcionarios')}}
    )     
select * 
from dim_funcionarios




