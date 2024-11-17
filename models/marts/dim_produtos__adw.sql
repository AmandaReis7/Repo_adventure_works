with
    int_produtos as (
     select *
     from {{ref('int_adw__product')}}
     )
     
 select * 
 from int_produtos




