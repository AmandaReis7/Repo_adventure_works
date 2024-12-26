with pessoas as (
    select
        businessentityid as pk_id_pessoa,
        persontype as tipo_pessoa,
        namestyle, 
        title,
        firstname, 
        middlename,
        lastname,
        suffix,
        emailpromotion,
        additionalcontactinfo, 
        demographics, 
        rowguid,  
        cast(modifieddate as date) as data_modificacao
    from {{ source("projeto_adw", "PERSON") }}
)
select * 
from pessoas