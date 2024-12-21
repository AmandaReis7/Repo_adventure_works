/*  
    Teste para verificar se a quantidade de pedidos segregada está compativel com a quantidade de pedidos original
    no ano de 2011 o valor distinto é 1.607
*/

{{ config (
        severity = 'error'
    )
}}

with
    pedido as (
        select 
            1 as id
            ,count(distinct id_pedido_venda) as qtd_pedido
        from {{ ref('stg_adw__orderheader') }}
        where year(data_pedido) = '2011'
) 
    select qtd_pedido
    from pedido
    where qtd_pedido != '1607' 