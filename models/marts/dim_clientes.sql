with
    clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    )

    , contatos as (
        select *
        from {{ ref('stg_erp__contatos') }}
    )

    , lojas as (
        select *
        from {{ ref('stg_erp__lojas') }}
    )

    , pessoas as (
        select *
        from {{ ref('stg_erp__pessoas') }}
    )

    , territorio as (
        select *
        from {{ ref('stg_erp__territorios') }}
    )

    , pais as (
        select *
        from {{ ref('stg_erp__pais') }}
    )

    , joined as (
        select
            clientes.PK_CLIENTE
            , clientes.FK_PESSOA
            , clientes.FK_LOJA
            , clientes.FK_CONTA
            , lojas.PK_ENTIDADE
            , lojas.NM_ENTIDADE
            , pessoas.NM_TITULO
            , pessoas.NM_P_NOME
            , pessoas.NM_M_NOME
            , pessoas.NM_U_NOME
            , pessoas.NM_SUFIXO
            , pessoas.NM_CLIENTE
            , territorio.FK_COD_PAIS              
            , territorio.NM_TERRITORIO
            , territorio.NM_GRUPO_TERRITORIO                      
        from clientes
        left join lojas on clientes.fk_loja = lojas.pk_entidade
        left join pessoas on clientes.fk_pessoa = pessoas.pk_entidade
        left join territorio on clientes.fk_territorio = territorio.pk_territorio
        
    )
    , joined2 as (
        select
            joined.*
            , pais.NM_PAIS
        from joined
        left join pais on joined.fk_cod_pais = pais.pk_cod_pais
    )

    select *
    from joined2