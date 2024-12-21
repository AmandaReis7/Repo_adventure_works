with
    dim_clientes as (
     select *
     from {{ref('int_adw__clientes')}}
     )     
select * 
from dim_clientes




