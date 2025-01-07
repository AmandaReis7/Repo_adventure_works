with
    lojas as (
        select
            businessentityid,
            name,
            salespersonid,
            demographics,
            rowguid,
            cast(modifieddate as date) as data_modificacao
        from 
            {{ source("projeto_adw", "store") }}
    )

select *
from lojas