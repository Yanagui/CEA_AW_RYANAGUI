with
    fonte_envio as (
        select 
            cast(SHIPMETHODID as varchar) as pk_envio
            , cast(NAME as varchar) as nm_envio
        from {{ source('erp', 'shipmethod') }}
    )

select * 
from fonte_envio