with
    fct_vendas as (
     select *
     from {{ref('int_adw__vendas')}}
    ),    
    dim_cartao_clientes as (
     select *
     from {{ref('dim_cartao_clientes__adw')}}     
    ),
    dim_clientes as (
     select *
     from {{ref('dim_clientes__adw')}}     
    ),
    dim_endereco as (
     select *
     from {{ref('dim_endereco__adw')}}     
    ),
    dim_funcionarios as (
     select *
     from {{ref('dim_funcionarios__adw')}}     
    ),
    dim_motivos_vendas as (
     select *
     from {{ref('dim_motivos_vendas__adw')}}     
    ),
    dim_produtos as (
     select *
     from {{ref('dim_produtos__adw')}}     
    )     
select * 
from fct_vendas




