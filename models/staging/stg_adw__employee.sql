with
    funcionarios as (
        select
            businessentityid as id_funcionario,  
            nationalidnumber,  
            loginid as id_login,  
            jobtitle,  
            birthdate,  
            maritalstatus,  
            gender as genero,  
            hiredate as dt_contratacao,  
            salariedflag as ind_func_assalariado,  
            vacationhours as horas_de_ferias,  
            sickleavehours as horas_de_licenca_medica,  
            currentflag as ind_ativo,  
            rowguid,  
            modifieddate,  
            organizationnode
        from 
            {{ source("projeto_adw", "employee") }}
    )

select *
from funcionarios