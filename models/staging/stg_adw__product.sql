with
    product as (
    select
         productid as pk_id_produto,
         name as nome_produto,
         productnumber as num_produto,
         makeflag as ind_fabricacao_interna,
         finishedgoodsflag as ind_produto_finalizado,
         color as cor,
         safetystocklevel as qtd_estoque,
         reorderpoint as nivel_de_reestoque,
         standardcost as custo_padrao,
         listprice as lista_de_preco,
         size as tamanho,
         sizeunitmeasurecode as cod_medida_tamanho,
         weightunitmeasurecode as cod_unid_med_peso,
         weight as peso,
         daystomanufacture as dias_para_fabricacao,
         productline,
         class,
         style,
         productsubcategoryid,
         productmodelid,
         cast(sellstartdate as date) as data_inicio_venda,
         cast(sellenddate as date) as data_fim_venda,
         discontinueddate as data_descontinicacao,
         rowguid,
         cast(modifieddate as date) as data_modificacao
        from {{source("projeto_adw", "PRODUCT")}} 
    )
select * from 
product