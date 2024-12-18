with
    clientes as (
        select
         customerid,
         personid,
         storeid,
         territoryid,
         rowguid,
         cast(modifieddate as data) as data_modificacao
        from {{source("projeto_adw", "CUSTOMER")}}

    )
    select * from
    clientes