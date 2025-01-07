with
    clientes as (
        select
            customerid,
            personid,
            storeid,
            territoryid,
            rowguid,
            cast(modifieddate as date) as data_modificacao
        from 
            {{ source("projeto_adw", "customer") }}
    )

select *
from clientes