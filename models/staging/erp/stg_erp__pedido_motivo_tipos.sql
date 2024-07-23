with
    fonte_pedido_motivo_tipos as (
        select 
            cast (SALESREASONID as int) as pk_motivo
            , cast (NAME as varchar) as nm_motivo
            , cast (REASONTYPE as varchar) as nm_motivo_tipo
        from {{ source('erp', 'salesreason') }}
    )

select * 
from fonte_pedido_motivo_tipos