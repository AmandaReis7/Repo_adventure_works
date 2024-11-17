with
    produtos as (
        select * 
        from {{ref('stg_adw__product')}}

    ),
    categorias as (
        select *
        from {{ref('stg_adw__productcategory')}}

    ),
    sub_categorias as (
        select *
        from {{ref('stg_adw__productsubcategory')}}

    ),
    produtos_completa as (
        select
        from produtos
        left join categorias on categorias.fk_id_categoria_produto = produtos.pk_id_produto
        left join sub_categorias on sub_categorias.id_subcategoria_product = produtos.productsubcategoryid
    )