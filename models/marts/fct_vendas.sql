with
    pedido_por_itens as (
        select *
        from {{ ref('int_pedido_por_itens') }}
    )

    , dim_produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , dim_clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )
    
    , dim_enderecos1 as (
        select *
        from {{ ref('dim_enderecos') }}
    )

    , dim_enderecos2 as (
        select *
        from {{ ref('dim_enderecos') }}
    )

    , pedido_motivos as (
        select *
        from {{ ref('int_pedido_motivos') }}
    )

    , joined as (
        select
            fatos.SK_VENDAS
            , fatos.PK_PEDIDO
            , fatos.DT_PEDIDO
            , fatos.DT_PRAZO
            , fatos.DT_ENVIO
            , fatos.FK_CLIENTE
            , fatos.NM_VENDEDOR
            , fatos.FK_STATUS_PEDIDO
            , fatos.NM_TERRITORIO
            , fatos.NM_GRUPO_TERRITORIO
            , fatos.NM_PAIS
            , fatos.FK_ENDERECO_FATURA
            , fatos.FK_ENDERECO_ENVIO
            , fatos.NM_ENVIO as METODO_ENVIO
            , fatos.NM_CARTAO_TIPO
            , fatos.V_SUBTOTAL_PEDIDO
            , fatos.V_TAXA_PEDIDO
            , fatos.V_FRETE_PEDIDO
            , fatos.V_TOTAL_PEDIDO
            , fatos.PK_PEDIDO_ITEM
            , fatos.V_QTDE_ITEM
            , fatos.FK_PRODUTO
            , fatos.V_PRECO_UNIT
            , fatos.V_DESCONTO_PRECO_UNIT
            , fatos.NM_OFERTA_ESPECIAL
            , fatos.V_OFERTA_DISCONTO
            , fatos.NM_OFERTA_TIPO
            , fatos.NM_OFERTA_CATEGORIA
            , dim_produtos.NM_PRODUTO
            , dim_produtos.FK_COD_PRODUTO
            , dim_produtos.NM_PRODUTO_MODELO
            , dim_produtos.NM_PRODUTO_CATEGORIA
            , dim_produtos.NM_PRODUTO_SUBCATEGORIA
            , dim_clientes.NM_ENTIDADE as nm_empresa_cliente
            , dim_clientes.FK_CONTA
            , dim_clientes.NM_CLIENTE
            , concat(dim_enderecos1.nm_provincia, '-', dim_enderecos1.nm_pais) as ENDERECO_FATURA
            , concat(dim_enderecos2.nm_provincia, '-', dim_enderecos2.nm_pais) as ENDERECO_ENVIO
            , pedido_motivos.NM_MOTIVO
            , pedido_motivos.NM_MOTIVO_TIPO
        from pedido_por_itens as fatos
        left join dim_produtos on fatos.fk_produto = dim_produtos.pk_produto
        left join dim_clientes on fatos.fk_cliente = dim_clientes.pk_cliente
        left join dim_enderecos1 on fatos.fk_endereco_envio = dim_enderecos1.pk_endereco
        left join dim_enderecos2 on fatos.fk_endereco_fatura = dim_enderecos2.pk_endereco
        left join pedido_motivos on fatos.PK_PEDIDO = pedido_motivos.fk_pedido        
    )

    , metricas as (
        select
            SK_VENDAS
            , PK_PEDIDO
            , DT_PEDIDO
            , DT_PRAZO
            , DT_ENVIO
            , FK_CLIENTE
            , NM_VENDEDOR
            , FK_STATUS_PEDIDO
            , NM_TERRITORIO
            , NM_GRUPO_TERRITORIO
            , NM_PAIS
            , FK_ENDERECO_FATURA
            , FK_ENDERECO_ENVIO
            , METODO_ENVIO
            , NM_CARTAO_TIPO
            , V_SUBTOTAL_PEDIDO
            , V_TAXA_PEDIDO
            , V_FRETE_PEDIDO
            , V_TOTAL_PEDIDO
            , PK_PEDIDO_ITEM
            , V_QTDE_ITEM
            , FK_PRODUTO
            , V_PRECO_UNIT
            , V_DESCONTO_PRECO_UNIT
            , NM_OFERTA_ESPECIAL
            , V_OFERTA_DISCONTO
            , NM_OFERTA_TIPO
            , NM_OFERTA_CATEGORIA
            , NM_PRODUTO
            , FK_COD_PRODUTO
            , NM_PRODUTO_MODELO
            , NM_PRODUTO_CATEGORIA
            , NM_PRODUTO_SUBCATEGORIA
            , NM_EMPRESA_CLIENTE
            , FK_CONTA
            , NM_CLIENTE
            , ENDERECO_FATURA
            , ENDERECO_ENVIO
            , NM_MOTIVO
            , NM_MOTIVO_TIPO
            , V_QTDE_ITEM * V_PRECO_UNIT as valor_bruto
            , V_QTDE_ITEM * (1 - V_OFERTA_DISCONTO) * V_PRECO_UNIT as valor_liquido
        from joined        
    )

select *
from metricas
