with
    cartao_clientes as (
        select
            creditcardid,
            cardtype,
            cardnumber,
            expmonth,
            expyear,
            cast(modifieddate as date) as data_modificacao
        from 
            {{ source("projeto_adw", "CREDITCARD") }}
    )

select  * 
from cartao_clientes