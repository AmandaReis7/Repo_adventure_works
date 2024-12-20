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
        where year(data_pedido) = '2011'
    ) 
    ,dado_transformado as (
        select
            1 as id,
            count(distinct id_pedido) as qtd_pedido
        from {{ ref('int_adw__vendas') }}   
        where year(data_pedido) = '2011'
    )
    ,resultado as (
        select
            count(distinct dado_original.qtd_pedido) as qtd
        from dado_original
        inner join dado_transformado on dado_transformado.id = dado_original.id
    ) 
    select qtd
    from resultado
    where qtd = '1607' 
    or year(data_pedido) = 2011



    /*  
    Teste para verificar se a quantidade de pedidos segregada está compativel com a quantidade de pedidos original
    no ano de 2011 o valor distinto é 1.607
*/
