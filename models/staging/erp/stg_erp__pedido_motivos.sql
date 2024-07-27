with
    fonte_pedido_motivos as (
        select 
            cast (SALESORDERID as int) as fk_pedido
            , cast (SALESREASONID as int) as fk_motivo
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

select * 
from fonte_pedido_motivos