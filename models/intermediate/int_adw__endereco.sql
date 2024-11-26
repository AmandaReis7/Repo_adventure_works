with
    territorio_vendas as (
     select *
     from {{ref('stg_adw__salesterritory')}}
 ), estado_provincia as (
     select *
     from {{ref('stg_adw__stateprovince')}}
 ), cod_regiao as (
     select *
     from {{ref('stg_adw__countryregion')}}
 ), endereco as (
     select *
     from {{ref('stg_adw__address')}}
 ),
    endereco_completa as (
     select
         endereco.id_endereco,
         endereco.endereco_1,
         endereco.endereco_2,
         endereco.cidade,
         estado_provincia.name as nome_estado,
         territorio_vendas.cod_pais as "CÓD_PAÍS",
         territorio_vendas.name as "TERRITÓRIO_VENDAS",
         cod_regiao.name as pais,
         endereco.cod_cx_postal,
         endereco.spatiallocation,
         endereco.rowguid,
         endereco.data_modificacao

     from estado_provincia
     left join endereco on endereco.id_estado = estado_provincia.id_estado
     left join territorio_vendas on territorio_vendas.id_territorio = estado_provincia.fk_id_territorio
     left join cod_regiao on cod_regiao.fk_cod_regiao = estado_provincia.cod_regiao_pais 
     ) 
 select * from 
 endereco_completa