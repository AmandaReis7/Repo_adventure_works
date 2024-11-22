with
    lojas as (
        select
         businessentityid,
         name,
         salespersonid,
         demographics,
         rowguid,
         modifieddate
        from {{source("projeto_adw", "STORE")}}

    )
    select * from
    lojas