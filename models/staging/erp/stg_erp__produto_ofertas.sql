with
    fonte_produto_ofertas as (
        select
            cast(SPECIALOFFERID as int) as pk_oferta_especial
            , cast(PRODUCTID as int) as pk_produto
        from {{ source('erp', 'specialofferproduct') }}
    )

select * 
from fonte_produto_ofertas