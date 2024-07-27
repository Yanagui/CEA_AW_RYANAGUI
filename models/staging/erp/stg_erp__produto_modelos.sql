with
    fonte_produto_modelos as (
        select 
            cast(PRODUCTMODELID as int) as pk_produto_modelo
            , cast(NAME as varchar) as nm_produto_modelo 
        from {{ source('erp', 'productmodel') }}
    )

select * 
from fonte_produto_modelos