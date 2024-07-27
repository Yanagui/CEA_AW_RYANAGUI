with
    fonte_pedidos as (
        select 
            cast (SALESORDERID as int) as pk_pedido
            , cast (ORDERDATE as varchar) as dt_pedido
            , cast (DUEDATE as varchar) as dt_prazo
            , cast (SHIPDATE as varchar) as dt_envio
            , cast (STATUS as int) as fk_status_pedido
            , cast (CUSTOMERID as int) as fk_cliente
            , cast (SALESPERSONID as int) as fk_vendedor
            , cast (TERRITORYID as int) as fk_territorio
            , cast (BILLTOADDRESSID as int) as fk_endereco_fatura
            , cast (SHIPTOADDRESSID as int) as fk_endereco_envio
            , cast (SHIPMETHODID as int) as fk_metodo_envio
            , cast (CREDITCARDID as varchar) as fk_creditcard
            , cast (SUBTOTAL as numeric(18,2)) as v_subtotal_pedido
            , cast (TAXAMT as numeric(18,2)) as v_taxa_pedido
            , cast (FREIGHT as numeric(18,2)) as v_frete_pedido
            , cast (TOTALDUE as numeric(18,2)) as v_total_pedido
        from {{ source('erp', 'salesorderheader') }}
    )

select * 
from fonte_pedidos