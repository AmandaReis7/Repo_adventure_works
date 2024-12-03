with 
    test_state_province as (
        select 
             stateprovinceid,
             stateprovincecode,
             name
        from {{ source("projeto_adw", "STATEPROVINCE") }}
        where
        stateprovinceid = 2
    )

    , test_validation as (
        select 
            * 
        from test_state_province 
        where 
            stateprovincecode != 'AK '
            or name != 'Alaska'
    )

select * 
from test_validation