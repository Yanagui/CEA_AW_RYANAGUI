with
    fonte_territorios as (
        select
            cast(TERRITORYID as int) as pk_territorio
            , cast(NAME as varchar) as nm_territorio
            , cast(COUNTRYREGIONCODE as varchar) as fk_cod_pais
            , cast(GROUP_ as varchar) as nm_grupo_territorio
        from {{ source('erp', 'salesterritory') }}
    )

select * 
from fonte_territorios