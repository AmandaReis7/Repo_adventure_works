with
    endereco as (
        select
            addressid as id_endereco,
            addressline1 as endereco_1,
            addressline2 as endereco_2,
            city as cidade,
            stateprovinceid as id_estado,
            postalcode as cod_cx_postal,
            spatiallocation,
            rowguid,
            cast(modifieddate as date) as data_modificacao
        from 
            {{ source("projeto_adw", "address") }}
    )

select *
from endereco