with
    fonte_pais as (
        select 
            cast(COUNTRYREGIONCODE as varchar) as pk_cod_pais
            , cast(NAME as varchar) as nm_pais
        from {{ source('erp', 'countryregion') }}
    )

select * 
from fonte_pais