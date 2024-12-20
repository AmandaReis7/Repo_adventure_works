/*  
Teste para garantia da qualidade e veracidade dos dados de saída:
Equipe de auditoria da contabilidade indica que as vendas brutas no ano de 2011 foram de $12.646.112,16.

*/

{{ config (
        severity = 'error'
    )
}}

with
    vlr_negoc_bruto as (
        select 
            sum(valor_bruto) as vlr
        from {{ ref('int_adw__vendas') }}
        where year(data_pedido) = '2011'
    ) 
    select vlr
    from vlr_negoc_bruto
    where vlr not between 12646112.11 and 12646112.21