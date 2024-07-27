with
    fonte_produto_subcategorias as (
        select 
            cast(PRODUCTSUBCATEGORYID as int) as pk_produto_subcategoria
            , cast(PRODUCTCATEGORYID as int) as fk_produto_categoria
            , cast(NAME as varchar) as nm_produto_subcategoria 
        from {{ source('erp', 'productsubcategory') }}
    )

select * 
from fonte_produto_subcategorias