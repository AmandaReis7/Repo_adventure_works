with
    pedidos_detalhe as (
        select * 
        from {{ ref("stg_adw__orderdetail") }}
    ),

    pedidos as (
        select *
        from {{ ref('stg_adw__orderheader') }}
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
            TO_CHAR(DATA_PEDIDO, 'MM/YYYY') AS COMPETENCIA,
            pedidos.DATA_PEDIDO,
            pedidos.DATA_VENCIMENTO,
            pedidos.DATA_ENVIO,
            pedidos.STATUS,
            pedidos.FLAG_PEDIDO_ONLINE,
            pedidos.NUM_PEDIDO_COMPRA,
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
            pedidos.TOTAL_DEVIDO,
            pedidos.COMENTARIO,
            pedidos.data_modificacao
        from pedidos_detalhe
        inner join pedidos 
            on pedidos.ID_PEDIDO_VENDA = pedidos_detalhe.id_pedido
    ),

    pedidos_completa2 as (
        select *,            
            case 
                when status = 1 then 'In process'
                when status = 2 then 'Approved'
                when status = 3 then 'Backordered'
                when status = 4 then 'Rejected'
                when status = 5 then 'Shipped'
                when status = 6 then 'Cancelled'
                else 'Not informed'
            end as dsc_status
        from pedidos_completa
    ),

    metricas as (
        select
            pedidos_completa2.*,
            pedidos_completa2.preco_unitario * pedidos_completa2.qtd_pedido as valor_bruto,
            pedidos_completa2.QTD_PEDIDO * pedidos_completa2.PRECO_UNITARIO * 
                (1 - pedidos_completa2.DESC_PRECO_UNIT) as valor_liquido,
            valor_liquido / pedidos_completa2.QTD_PEDIDO as ticket_medio       
        from pedidos_completa2        
    ),

    final_select as (
        select
            ID_CLIENTE,
            ID_VENDEDOR,
            ID_DETALHE_PEDIDO,
            ID_PEDIDO,
            ID_PRODUTO,
            NUM_PEDIDO_COMPRA,
            cast(QTD_PEDIDO as numeric) as QTD_PEDIDO,
            OFERTA_ESPECIAL as ID_OFERTA,
            TO_DATE(TO_CHAR(DATA_PEDIDO, 'YYYY-MM') || '-01', 'YYYY-MM-DD') as COMPETENCIA, 
            DATA_PEDIDO,
            DATA_ENVIO,
            DATA_VENCIMENTO,
            cast(PRECO_UNITARIO as numeric(18,2)) as PRECO_UNITARIO,
            cast(DESC_PRECO_UNIT as numeric(18,2)) as DESC_PRECO_UNIT,
            cast(SUBTOTAL as numeric(18,2)) as SUBTOTAL,
            cast(VLR_IMPOSTO as numeric(18,2)) as VLR_IMPOSTO,
            cast(FRETE as numeric(18,2)) as FRETE,
            cast(TOTAL_DEVIDO as numeric(18,2)) as TOTAL_DEVIDO,
            cast(VALOR_BRUTO as numeric(18,2)) as VALOR_BRUTO,
            cast(VALOR_LIQUIDO as numeric(18,2)) as VALOR_LIQUIDO,             
            cast(TICKET_MEDIO as numeric(18,2)) as TICKET_MEDIO,
            DSC_STATUS,
            ID_TAXA_CAMBIO,
            ID_METODO_ENVIO,
            ID_ENDERECO_ENVIO,
            NUM_RASTREAMENTO,
            NUM_CONTA,
            ID_ENDERECO_COBRANCA,
            ID_CARTAO_CRED,
            CD_APROV_CARTAO_CRED,
            FLAG_PEDIDO_ONLINE,
            COMENTARIO,
            DATA_MODIFICACAO             
        from metricas
    )

select *
from final_select
