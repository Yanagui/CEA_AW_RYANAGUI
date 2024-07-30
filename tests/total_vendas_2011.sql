with
    pedidos_em_2011 as (
        select sum(valor_bruto) as total_bruto
        from {{ ref('fct_vendas') }}
        where dt_pedido between '2011-01-01' and '2011-12-31' --and v_desconto_preco_unit > 0    
    )

select total_bruto
from pedidos_em_2011 -- 12646112.16
where total_bruto not between 12646112 and 12646113