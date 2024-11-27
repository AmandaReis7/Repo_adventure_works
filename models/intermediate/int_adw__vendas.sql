 with
    pedidos_detalhe as (
     select * 
     from {{ref("stg_adw__orderdetail")}}
 ),
    pedidos as (
     select *
     from {{ref('stg_adw__orderheader')}}
),
    pedidos_completa as (
     select
         pedidos.ID_CLIENTE,
         pedidos.ID_VENDEDOR,
         pedidos_detalhe.ID_DETALHE_PEDIDO,
         pedidos_detalhe.ID_PEDIDO,
         pedidos_detalhe.NUM_RASTREAMENTO,
         pedidos_detalhe.QTD_PEDIDO,
         pedidos_detalhe.ID_PRODUTO,
         pedidos_detalhe.OFERTA_ESPECIAL,
         pedidos_detalhe.PRECO_UNITARIO,
         pedidos_detalhe.DESC_PRECO_UNIT,
         pedidos.DATA_VENCIMENTO,
         pedidos.DATA_ENVIO,
         pedidos.STATUS,
         pedidos.FLAG_PEDIDO_ONLINE,
         pedidos.NUM_PEDIDO_COMPRA as pedido_compra,
         pedidos.NUM_CONTA,
         pedidos.ID_ENDERECO_COBRANCA,
         pedidos.ID_ENDERECO_ENVIO,
         pedidos.ID_METODO_ENVIO,
         pedidos.ID_CARTAO_CRED,
         pedidos.CD_APROV_CARTAO_CRED,
         pedidos.ID_TAXA_CAMBIO,
         pedidos.SUBTOTAL,
         pedidos.VLR_IMPOSTO,
         pedidos.FRETE,
        -- SUM(pedidos.FRETE) / COUNT(DISTINCT pedidos.NUM_PEDIDO_COMPRA) AS frete_rateado,
         pedidos.TOTAL_DEVIDO,
         pedidos.COMENTARIO

     from pedidos_detalhe
     inner join pedidos on pedidos.ID_PEDIDO_VENDA = pedidos_detalhe.id_pedido
     ),
    metricas as (
        select
             pedidos_completa.*,
             pedidos_detalhe.QTD_PEDIDO * pedidos_detalhe.PRECO_UNITARIO AS valor_bruto,
             pedidos_detalhe.QTD_PEDIDO * pedidos_detalhe.PRECO_UNITARIO * (1 - pedidos_detalhe.DESC_PRECO_UNIT) AS valor_liquido,
             -- Cálculo do ticket médio, com a subtração do valor bruto pelo valor de desconto
             (pedidos_detalhe.QTD_PEDIDO * pedidos_detalhe.PRECO_UNITARIO  - pedidos_detalhe.QTD_PEDIDO * pedidos_detalhe.PRECO_UNITARIO * pedidos_detalhe.DESC_PRECO_UNIT) / COUNT(DISTINCT pedidos.NUM_PEDIDO_COMPRA) OVER(PARTITION BY pedidos.id_cliente) as numero_pedidos_cliente
        FROM pedidos_completa
        INNER JOIN pedidos_detalhe ON pedidos_completa.id_pedido = pedidos_detalhe.id_pedido
    )
SELECT * 
FROM metricas