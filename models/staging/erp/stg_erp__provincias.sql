with
    fonte_provincias as (
        select
            cast(STATEPROVINCEID as int) as pk_provincia
            , cast(STATEPROVINCECODE as varchar) as pk_cod_provincia
            , cast(COUNTRYREGIONCODE as varchar) as fk_cod_pais
            , cast(NAME as varchar) as nm_provincia
            , cast(TERRITORYID as int) as fk_territorio
        from {{ source('erp', 'stateprovince') }}
    )

select * 
from fonte_provincias