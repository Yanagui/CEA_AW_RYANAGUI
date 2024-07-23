with
    fonte_pedido_itens as (
        select
            cast(SALESORDERID as int) as pk_pedido
            , cast(SALESORDERDETAILID as int) as pk_pedido_item
            , cast(ORDERQTY as int) as v_qtde_item
            , cast(PRODUCTID as int) as pk_produto
            , cast(SPECIALOFFERID as int) as pk_oferta_especial
            , cast(UNITPRICE as numeric(18,2)) as v_preco_unit
            , cast(UNITPRICEDISCOUNT as numeric(18,2)) as v_desconto_preco_unit
        from {{ source('erp', 'salesorderdetail') }}
        --where unitpricediscount != 0
    )

select * 
from fonte_pedido_itens