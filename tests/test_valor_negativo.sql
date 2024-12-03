with
    negative_value as (
        select 
             totaldue
        from {{ source("projeto_adw", "SALESORDERHEADER") }}
    )

 select *
from negative_value
where totaldue < 0