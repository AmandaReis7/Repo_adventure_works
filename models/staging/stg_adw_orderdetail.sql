with 
    order_detail as (
         select  
         salesorderdetailid as id_detalhe_pedido,  
         salesorderid as id_pedido,  
         carriertrackingnumber as num_rastreamento, 
         orderqty as qtd_pedido,  
         productid as id produto,  
         specialofferid as oferta_especial,  
         unitprice as preco_unitario,  
         unitpricediscount as desc_preco_unit , 
         rowguid, 
         cast(modifieddate as date) data_modificacao
    from {{ source("projeto_adw", "orderdetail") }}

)
select * from order_detail