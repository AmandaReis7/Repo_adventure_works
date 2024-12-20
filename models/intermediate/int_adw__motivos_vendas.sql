with
    motivos_venda as (
     select *
     from {{ref('stg_adw__salesreason')}}
 ), pedidos_motivos_vendas as (
     select *
     from {{ref('stg_adw__SalesOrderHeaderSalesReason')}}
 ),
    motivos_vendas_agrupados as (
     select
             pedidos_motivos_vendas.id_pedido_venda,    
             LISTAGG(pedidos_motivos_vendas.id_motivo_venda, ', ') 
                WITHIN GROUP (ORDER BY pedidos_motivos_vendas.id_motivo_venda) as motivos_agrupados,
             -- Usando LISTAGG para concatenar os nomes dos motivos de venda
             LISTAGG(motivos_venda.nome_motivo_venda, ', ') 
                WITHIN GROUP (ORDER BY motivos_venda.nome_motivo_venda) as nomes_motivo_venda     
     FROM pedidos_motivos_vendas
     LEFT JOIN motivos_venda ON motivos_venda.id_motivo_venda = pedidos_motivos_vendas.id_motivo_venda
      group by 
      pedidos_motivos_vendas.id_pedido_venda
     ) 
select * from 
motivos_vendas_agrupados