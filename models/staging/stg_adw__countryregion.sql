with
    cod_regiao as (
        select
         countryregioncode as fk_cod_regiao,
         name, 
         cast(modifieddate as date) as data_modificacao
        from {{source("projeto_adw", "COUNTRYREGION")}}

    )
    select * from
    cod_regiao