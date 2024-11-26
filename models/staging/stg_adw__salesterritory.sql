with
    territorio_vendas as (
        select
         territoryid as id_territorio,
         name,
         countryregioncode as cod_pais,
         "group",
         salesytd as vendas_do_ano,
         saleslastyear as vendas_ano_aterior,
         costytd as custo_do_ano,
         costlastyear as custo_ano_anterior,
         rowguid,
         modifieddate as data_modificacao
        from {{source("projeto_adw", "SALESTERRITORY")}}

    )
    select * from
    territorio_vendas