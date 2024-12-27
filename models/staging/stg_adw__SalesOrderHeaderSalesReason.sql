with
    pedidos_motivos_vendas as (
        select
             salesorderid as id_pedido_venda,
            salesreasonid as id_motivo_venda,
            cast(modifieddate as date) as data_modificacao
        from 
            {{ source("projeto_adw", "SALESORDERHEADERSALESREASON") }}
    )

select *
from pedidos_motivos_vendas