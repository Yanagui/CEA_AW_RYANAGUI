with
    fonte_pedido_itens as (
        select
            cast(SALESORDERDETAILID as int) as pk_pedido_item
            , cast(SALESORDERID as int) as fk_pedido
            , cast(ORDERQTY as int) as v_qtde_item
            , cast(PRODUCTID as int) as fk_produto
            , cast(SPECIALOFFERID as int) as fk_oferta_especial
            , cast(UNITPRICE as numeric(18,2)) as v_preco_unit
            , cast(UNITPRICEDISCOUNT as numeric(18,2)) as v_desconto_preco_unit
        from {{ source('erp', 'salesorderdetail') }}
        --where unitpricediscount != 0
    )

select * 
from fonte_pedido_itens