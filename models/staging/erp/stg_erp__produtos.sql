with
    fonte_produtos as (
        select 
            cast(PRODUCTID as int) as pk_produto
           ,cast(NAME as varchar) as nm_produto
           ,cast(PRODUCTNUMBER as varchar) as pk_cod_produto
        from {{ source('erp', 'product') }}
    )

select * 
from fonte_produtos