with
    fonte_produtos as (
        select 
           cast(PRODUCTID as int) as pk_produto
           , cast(NAME as varchar) as nm_produto
           , cast(PRODUCTNUMBER as varchar) as fk_cod_produto
           , cast(PRODUCTSUBCATEGORYID as int) as fk_subcategoria
           , cast(PRODUCTMODELID as int) as fk_modelo
        from {{ source('erp', 'product') }}
    )

select * 
from fonte_produtos