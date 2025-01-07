with
    estado_provincia as (
        select
            stateprovinceid as id_estado,
            stateprovincecode as cod_estado,
            countryregioncode as cod_regiao_pais,
            isonlystateprovinceflag,
            name,
            territoryid as pk_id_territorio,
            rowguid,
            cast(modifieddate as date) as data_modificacao
        from 
            {{ source("projeto_adw", "stateprovince") }}
    )

select *
from estado_provincia