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

    , joined as (
        select
            fatos.SK_VENDAS
            , fatos.PK_PEDIDO
            , fatos.DT_PEDIDO
            , fatos.DT_PRAZO
            , fatos.DT_ENVIO
            , fatos.FK_CLIENTE
            , fatos.FK_VENDEDOR -- puxar dados vendedor
            , fatos.NM_TERRITORIO
            , fatos.NM_GRUPO_TERRITORIO
            , fatos.NM_PAIS
            , fatos.FK_ENDERECO_FATURA
            , fatos.FK_ENDERECO_ENVIO
            , fatos.FK_METODO_ENVIO -- puxar dados metodo envio
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
            , concat(dim_enderecos1.nm_provincia, '-', dim_enderecos1.nm_pais) as endereco_fatura
            , concat(dim_enderecos2.nm_provincia, '-', dim_enderecos2.nm_pais) as endereco_envio
        from pedido_por_itens as fatos
        left join dim_produtos on fatos.fk_produto = dim_produtos.pk_produto
        left join dim_clientes on fatos.fk_cliente = dim_clientes.pk_cliente
        left join dim_enderecos1 on fatos.fk_endereco_envio = dim_enderecos1.pk_endereco
        left join dim_enderecos2 on fatos.fk_endereco_fatura = dim_enderecos2.pk_endereco
    )

select *
from joined