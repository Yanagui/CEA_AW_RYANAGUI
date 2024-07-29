with
    vendas_em_2021 as (
        select sum(valor_bruto) as total_bruto
        , min(DATA_DO_PEDIDO) as min_dt_pedido
        , max(DATA_DO_PEDIDO) as max_dt_pedido
        from {{ ref('fct_vendas') }}
        where data_do_pedido between '2021-01-01' and '2021-12-31'
    )

select total_bruto
from vendas_em_2021 -- 12646112.16