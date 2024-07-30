with
    pedidos_em_2011 as (
        select sum(valor_bruto) as total_bruto
        , left(dt_pedido, 4) as ano
        from {{ ref('fct_vendas') }} 
        group by ano
    )

select total_bruto
from pedidos_em_2011 -- 12646112.16
where ano = '2011' and total_bruto not between 12646100 and 12646113