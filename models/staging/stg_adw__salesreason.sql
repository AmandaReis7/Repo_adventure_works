with
    motivos_venda as (
        select
         salesreasonid as id_motivo_venda,
         name as nome_motivo_venda,
         reasontype as tipo_motivo_venda,
         cast(modifieddate as date) as data_modificacao
        from {{source("projeto_adw", "SALESREASON")}}
    )
select * from
motivos_venda