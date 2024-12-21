 with
    funcionarios as (
     select * 
     from {{ref("stg_adw__employee")}}
),
    pessoas as (
     select *
     from {{ref('stg_adw__pessoas')}}
),
    funcionarios_completa as (
     select
         funcionarios.id_funcionario,
         funcionarios.nationalidnumber as num_identificacao_nacional,
         funcionarios.id_login,
         funcionarios.jobtitle as cargo,
         pessoas.firstname as primeiro_nome,
         pessoas.middlename as nome_do_meio,
         pessoas.lastname as sobrenome,
         pessoas.firstname ||' '|| pessoas.middlename ||' ' || pessoas.lastname as Nome_completo,
         funcionarios.birthdate as dt_nascimento,
         funcionarios.maritalstatus as estado_civil,
         funcionarios.genero,
         funcionarios.dt_contratacao,
         funcionarios.ind_func_assalariado,
         funcionarios.horas_de_ferias,
         funcionarios.horas_de_licenca_medica,
         funcionarios.ind_ativo,
         funcionarios.rowguid,
         funcionarios.modifieddate,
         funcionarios.organizationnode
     from pessoas
     left join funcionarios on funcionarios.id_funcionario = pessoas.pk_id_pessoa
) 
select * 
from 
funcionarios_completa