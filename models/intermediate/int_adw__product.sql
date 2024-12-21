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
        produtos.PK_ID_PRODUTO as ID_PRODUTO,
        produtos.NOME_PRODUTO,
        produtos.NUM_PRODUTO,
        produtos.IND_FABRICACAO_INTERNA,
        produtos.IND_PRODUTO_FINALIZADO,
        produtos.COR,
        produtos.QTD_ESTOQUE,
        produtos.NIVEL_DE_REESTOQUE,
        produtos.CUSTO_PADRAO,
        produtos.LISTA_DE_PRECO,
        produtos.TAMANHO,
        produtos.COD_MEDIDA_TAMANHO,
        produtos.COD_UNID_MED_PESO,
        produtos.PESO,
        produtos.DIAS_PARA_FABRICACAO,
        produtos.PRODUCTLINE,
        produtos.class,
        categorias.PK_ID_CATEGORIA_PRODUTO as ID_CATEGORIA,
        categorias.NOME_CATEGORIA,
        categorias.ROWGUID,
        sub_categorias.NOME_SUBCATEGORY
     from produtos
     left join categorias on categorias.pk_id_categoria_produto = produtos.pk_id_produto
     left join sub_categorias on sub_categorias.id_subcategoria_product = produtos.productsubcategoryid
) 
select * 
from 
produtos_completa