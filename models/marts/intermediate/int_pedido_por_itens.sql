with
    ordens as (
        select *
        from {{ ref('stg_erp__pedidos') }}
    )

    , ordem_detalhes as (
        select *
        from {{ ref('stg_erp__pedido_itens') }}
    )
    
    , envio as (
        select *
        from {{ ref('stg_erp__envio') }}
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

    , vendedores as (
        select *
        from {{ ref('stg_erp__pessoas') }}
    )

    , joined as (
        select
            ordens.PK_PEDIDO
            , ordens.DT_PEDIDO
            , ordens.DT_PRAZO
            , ordens.DT_ENVIO
            , ordens.FK_CLIENTE
            , ordens.FK_VENDEDOR
            , ordens.FK_STATUS_PEDIDO
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
            , ofertas.NM_OFERTA_ESPECIAL
            , ofertas.V_OFERTA_DISCONTO
            , ofertas.NM_OFERTA_TIPO
            , ofertas.NM_OFERTA_CATEGORIA
        from ordem_detalhes
        left join ordens on ordem_detalhes.fk_pedido = ordens.pk_pedido
        left join ofertas on ordem_detalhes.fk_oferta_especial = ofertas.pk_oferta_especial
    )

    , joined2 as (
        select
            cast(FK_PEDIDO as varchar) || '-' || cast(FK_PRODUTO as varchar) as sk_vendas
            , joined.*            
            , cartoes.NM_CARTAO_TIPO
            , vendedores.NM_CLIENTE as NM_VENDEDOR
            , envio.NM_ENVIO
            , territorios.NM_TERRITORIO
            , territorios.NM_GRUPO_TERRITORIO
            , territorios.FK_COD_PAIS
        from joined
        left join envio on joined.fk_metodo_envio = envio.pk_envio                
        left join cartoes on joined.fk_creditcard = cartoes.pk_cartao
        left join vendedores on joined.fk_vendedor = vendedores.pk_entidade
        left join territorios on joined.fk_territorio = territorios.pk_territorio        
    )
    
    , criada_chave_primaria as (
        select
            joined2.*
            , pais.NM_PAIS
        from joined2
        left join pais on joined2.fk_cod_pais = pais.pk_cod_pais
    )

select *
from criada_chave_primaria