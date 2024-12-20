with
    product_subcategory as (
     select
         productsubcategoryid as id_subcategoria_product,
         productcategoryid as id_categoria_produto,
         name as nome_subcategory,
         rowguid,
         cast(modifieddate as date) as data_modificacao
        from {{source ("projeto_adw", "PRODUCTSUBCATEGORY")}}
    )
select * from
product_subcategory



