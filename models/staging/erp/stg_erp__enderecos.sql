with
    fonte_enderecos as (
        select
            cast(addressid as int) as pk_endereco
            , cast(addressline1 as varchar) as nm_endereco1
            , cast(addressline2 as varchar) as nm_endereco2
            , cast(city as varchar) as nm_cidade
            , cast(postalcode as varchar) as nm_caixa_postal
            , cast(stateprovinceid as int) as fk_provincia
        from {{ source('erp', 'address') }}
    )

select * 
from fonte_enderecos