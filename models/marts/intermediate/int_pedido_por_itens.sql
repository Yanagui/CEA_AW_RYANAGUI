with
    ordens as (
        select *
        from {{ ref('stg_erp__pedidos') }}
    )

    , ordem_detalhes as (
        select *
        from {{ ref('stg_erp__pedido_itens') }}
    )

    , territorios as (
        select *
        from {{ ref('stg_erp__territorios') }}
    )

    , pais as (
        select *
        from {{ ref('stg_erp__pais') }}
    )

    , ofertas as (
        select *
        from {{ ref('stg_erp__ofertas') }}
    )

    , cartoes as (
        select *
        from {{ ref('stg_erp__cartoes') }}
    )

    , joined as (
        select
            ordens.PK_PEDIDO
            , ordens.DT_PEDIDO
            , ordens.DT_PRAZO
            , ordens.DT_ENVIO
            , ordens.FK_CLIENTE
            , ordens.FK_VENDEDOR
            , ordens.FK_TERRITORIO
            , ordens.FK_ENDERECO_FATURA
            , ordens.FK_ENDERECO_ENVIO
            , ordens.FK_METODO_ENVIO
            , ordens.FK_CREDITCARD
            , ordens.V_SUBTOTAL_PEDIDO
            , ordens.V_TAXA_PEDIDO
            , ordens.V_FRETE_PEDIDO
            , ordens.V_TOTAL_PEDIDO
            , ordem_detalhes.PK_PEDIDO_ITEM
            , ordem_detalhes.FK_PEDIDO
            , ordem_detalhes.V_QTDE_ITEM
            , ordem_detalhes.FK_PRODUTO
            , ordem_detalhes.FK_OFERTA_ESPECIAL
            , ordem_detalhes.V_PRECO_UNIT
            , ordem_detalhes.V_DESCONTO_PRECO_UNIT
            , territorios.NM_TERRITORIO
            , territorios.NM_GRUPO_TERRITORIO
            , pais.NM_PAIS
            , ofertas.NM_OFERTA_ESPECIAL
            , ofertas.V_OFERTA_DISCONTO
            , ofertas.NM_OFERTA_TIPO
            , ofertas.NM_OFERTA_CATEGORIA
            , cartoes.NM_CARTAO_TIPO
        from ordem_detalhes
        left join ordens on ordem_detalhes.fk_pedido = ordens.pk_pedido
        left join territorios on ordens.fk_territorio = territorios.pk_territorio
        left join pais on territorios.fk_cod_pais = pais.pk_cod_pais
        left join ofertas on ordem_detalhes.fk_oferta_especial = ofertas.pk_oferta_especial
        left join cartoes on ordens.fk_creditcard = cartoes.pk_cartao
    )

    , criada_chave_primaria as (
        select
            cast(FK_PEDIDO as varchar) || '-' || cast(FK_PRODUTO as varchar) as sk_vendas
            , *
        from joined
    )

select *
from criada_chave_primaria