with
    fonte_lojas as (
        select
            cast(BUSINESSENTITYID as int) as pk_entidade
            , cast(NAME as varchar) as nm_entidade
        from {{ source('erp', 'store') }}
    )

select * 
from fonte_lojas