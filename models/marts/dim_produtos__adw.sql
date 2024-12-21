with
    dim_produtos as (
     select *
     from {{ref('int_adw__product')}}
     )     
select * 
from dim_produtos




