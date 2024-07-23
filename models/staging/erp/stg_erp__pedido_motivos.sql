with
    fonte_pedido_motivos as (
        select 
            cast (SALESORDERID as int) as pk_pedido
            , cast (SALESREASONID as int) as pk_motivo
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

select * 
from fonte_pedido_motivos