 with
    lojas as (
     select * 
     from {{ref("stg_adw__store")}}
 ),
    clientes as (
     select *
     from {{ref('stg_adw__customer')}}
),
    pessoas as (
     select *
     from {{ref('stg_adw__pessoas')}}
 ),
    clientes_completa as (
     select
         clientes.customerid as id_clientes,
         clientes.personid as id_pessoa,
         clientes.territoryid as id_territorio_vendas,
         pessoas.firstname||' '||pessoas.middlename||' '||pessoas.lastname as Nome_completo,    
         pessoas.tipo_pessoa,
         lojas.name as nome_loja
     from pessoas
     left join clientes on clientes.customerid = pessoas.fk_id_pessoa
     left join lojas on lojas.businessentityid = pessoas.fk_id_pessoa
     ) 
select * from 
clientes_completa