with
    fonte_clientes as (
        select 
            cast (CUSTOMERID as int) as pk_cliente
            , cast (PERSONID as int) as fk_pessoa
            , cast (STOREID as int) as fk_loja
            , cast (TERRITORYID as int) as fk_territorio
            , cast (ACCOUNTNUMBER as varchar) as fk_conta
        from {{ source('erp', 'customer') }}
    )

select * 
from fonte_clientes