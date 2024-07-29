with
    fonte_cartoes as (
        select
            cast(CREDITCARDID as int) as pk_cartao
            , cast(CARDTYPE as varchar) as nm_cartao_tipo
        from {{ source('erp', 'creditcard') }}
    )

select * 
from fonte_cartoes