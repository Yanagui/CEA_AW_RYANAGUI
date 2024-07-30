with
    produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    )

    , subcategorias as (
        select *
        from {{ ref('stg_erp__produto_subcategorias') }}
    )

    , categorias as (
        select *
        from {{ ref('stg_erp__produto_categorias') }}
    )

    , modelos as (
        select *
        from {{ ref('stg_erp__produto_modelos') }}
    )

    , joined as (
        select
            produtos.PK_PRODUTO
            , produtos.NM_PRODUTO
            , produtos.FK_COD_PRODUTO
            , modelos.NM_PRODUTO_MODELO
            , subcategorias.NM_PRODUTO_SUBCATEGORIA
            , subcategorias.FK_PRODUTO_CATEGORIA          
        from produtos
        left join modelos on produtos.fk_modelo = modelos.pk_produto_modelo
        left join subcategorias on produtos.fk_subcategoria = subcategorias.pk_produto_subcategoria
        left join categorias on subcategorias.fk_produto_categoria = categorias.pk_produto_categoria
    )

    , joined2 as (
        select 
            joined.*
            , categorias.NM_PRODUTO_CATEGORIA  
        from joined
        left join categorias on joined.fk_produto_categoria = categorias.pk_produto_categoria
    )

select *
from joined2