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
            {{ source("projeto_adw", "creditcard") }}
    )

select  * 
from cartao_clientes