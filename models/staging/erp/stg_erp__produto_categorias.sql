with
    fonte_produto_categorias as (
        select 
            cast(PRODUCTCATEGORYID as int) as pk_produto_categoria
            , cast(NAME as varchar) as nm_produto_categoria 
        from {{ source('erp', 'productcategory') }}
    )

select * 
from fonte_produto_categorias