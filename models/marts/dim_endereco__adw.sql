with
    dim_endereco as (
     select *
     from {{ref('int_adw__endereco')}}
     )     
select * 
from dim_endereco




