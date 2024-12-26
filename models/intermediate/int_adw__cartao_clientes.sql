with
    cartao_clientes as (
        select *
        from {{ref('stg_adw__creditcard')}}
    ),
    orderheader as (
        select *
        from {{ref('stg_adw__orderheader')}}
    ),
    cartao_clientes_completa as (
        select
            creditcardid as id_cartao_cliente,
            cardtype as tipo_cartao,
            cardnumber as numero_cartao,
            expmonth as mes_expiracao,
            expyear as ano_expiracao
        from orderheader
        left join cartao_clientes
            on cartao_clientes.creditcardid = orderheader.id_cartao_cred
    )
select * 
from cartao_clientes_completa