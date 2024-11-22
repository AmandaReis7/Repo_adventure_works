with
    pessoas as (
        select
         businessentityid as fk_id_pessoa,
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
         modifieddate
                 from {{source("projeto_adw", "PERSON")}}

    )
    select * from
    pessoas