with
    fonte_produto_categorias as (
        select 
            cast(PRODUCTCATEGORYID as int) as pk_produto
            , cast(NAME as varchar) as nm_produto 
        from {{ source('erp', 'productcategory') }}
    )

select * 
from fonte_produto_categorias