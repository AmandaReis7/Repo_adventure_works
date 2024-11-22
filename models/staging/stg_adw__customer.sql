with
    clientes as (
        select
         customerid,
         personid,
         storeid,
         territoryid,
         rowguid,
         modifieddate
        from {{source("projeto_adw", "CUSTOMER")}}

    )
    select * from
    clientes