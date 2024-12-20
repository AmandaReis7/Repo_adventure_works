/*  
    Teste para verificar se a quantidade de pedidos segregada está compativel com a quantidade de pedidos original
    Por conta do arredondamento, como referencia, a quantidade de pedidos nao pode ser superior a 5

*/

{{ config (
        severity = 'error'
    )
}}

with
    dado_original as (
        select 
            1 as id
            ,count(distinct id_pedido_venda) as qtd_pedido
        from {{ ref('stg_adw__orderheader') }}
    ) 
    ,dado_transformado as (
        select
            1 as id
            ,round(sum(qtd_pedido),0) as qtd_pedido
        from {{ ref('int_adw__vendas') }}   
    )
    ,resultado as (
        select
            abs(dado_original.qtd_pedido - dado_transformado.qtd_pedido) as dif
        from dado_original
        inner join dado_transformado on dado_transformado.id = dado_original.id
    ) 
    select dif
    from resultado
    where dif not between 0 and 5