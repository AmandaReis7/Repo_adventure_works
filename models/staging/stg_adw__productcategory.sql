with
    product_category as (
        select
         productcategoryid as pk_id_categoria_produto,  
         name as nome_categoria,  
         rowguid,  
         cast(modifieddate as date) as data_modificacao
        from {{source("projeto_adw", "PRODUCTCATEGORY")}}

    )
    select * from
    product_category