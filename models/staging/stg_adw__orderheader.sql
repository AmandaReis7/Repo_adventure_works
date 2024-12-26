with orderheader as (
    select
        salesorderid as id_pedido_venda,  
        revisionnumber as num_revisao,  
        cast(orderdate as date) as data_pedido,  
        cast(duedate as date) as data_vencimento,  
        cast(shipdate as date) as data_envio,  
        status,  
        onlineorderflag as flag_pedido_online,  
        purchaseordernumber as num_pedido_compra,  
        accountnumber as num_conta,  
        customerid as id_cliente,  
        salespersonid as id_vendedor,  
        territoryid as id_territorio,  
        billtoaddressid as id_endereco_cobranca,  
        shiptoaddressid as id_endereco_envio,  
        shipmethodid as id_metodo_envio,  
        creditcardid as id_cartao_cred,  
        creditcardapprovalcode as cd_aprov_cartao_cred,  
        currencyrateid as id_taxa_cambio,  
        subtotal,  
        taxamt as vlr_imposto,  
        freight as frete,  
        totaldue as total_devido,  
        comment as comentario,  
        cast(modifieddate as date) as data_modificacao,
        rowguid as guia_linha
    from {{ source("projeto_adw", "SALESORDERHEADER") }} 
)
select * 
from orderheader