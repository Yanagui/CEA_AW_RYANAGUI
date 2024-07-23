with
    fonte_clientes as (
        select 
            cast (CUSTOMERID as int) as pk_cliente
            , cast (PERSONID as int) as pk_pessoa
            , cast (STOREID as int) as pk_loja
            , cast (TERRITORYID as int) as pk_territorio
            , cast (ACCOUNTNUMBER as varchar) as pk_conta
        from {{ source('erp', 'customer') }}
    )

select * 
from fonte_clientes