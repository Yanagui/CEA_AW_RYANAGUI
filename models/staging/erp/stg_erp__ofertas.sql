with
    fonte_ofertas as (
        select
            cast(SPECIALOFFERID as int) as pk_oferta_especial
            , cast(DESCRIPTION as varchar) as nm_oferta_especial
            , cast(DISCOUNTPCT as numeric(18,2)) as v_oferta_disconto
            , cast(TYPE as varchar) as nm_oferta_tipo
            , cast(CATEGORY as varchar) as nm_oferta_categoria
        from {{ source('erp', 'specialoffer') }}
    )

select * 
from fonte_ofertas