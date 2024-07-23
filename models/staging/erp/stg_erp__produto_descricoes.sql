with
    fonte_produto_descricoes as (
        select
            cast(PRODUCTDESCRIPTIONID as int) as pk_produto_descr
            , cast(DESCRIPTION as varchar) as nm_produto_descr
        from {{ source('erp', 'productdescription') }}
    )

select * 
from fonte_produto_descricoes