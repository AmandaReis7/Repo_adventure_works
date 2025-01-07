with
    territorio_vendas as (
        select
            territoryid as id_territorio,
            name,
            countryregioncode as cod_pais,
            "group",
            salesytd as vendas_do_ano,
            saleslastyear as vendas_ano_anterior,
            costytd as custo_do_ano,
            costlastyear as custo_ano_anterior,
            rowguid,
            cast(modifieddate as date) as data_modificacao
        from 
            {{ source("projeto_adw", "salesterritory") }}
    )

select *
from territorio_vendas