with
    pessoas as (
        select *
        from {{ ref('stg_erp__pessoas') }}
    )

    , funcionarios as (
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    ,clientes as (
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

    , fornecedores as (
        select *
        from {{ ref('stg_erp__fornecedores') }}
    )

    , joined as (
        select
            pessoas.PK_ENTIDADE
            , pessoas.NM_CLIENTE as NM_PESSOA
            , funcionarios.NM_CARGO
            , clientes.PK_CLIENTE
            , clientes.FK_PESSOA
            , clientes.FK_LOJA
            , clientes.FK_CONTA            
            , fornecedores.NM_ENTIDADE as NM_FORNECEDOR
            , fornecedores.COD_CONTA as COD_CONTA_FORNECEDOR            
        from pessoas
        left join funcionarios on pessoas.pk_entidade = funcionarios.pk_entidade
        left join fornecedores on pessoas.pk_entidade = fornecedores.pk_entidade
        left join clientes on pessoas.pk_entidade = clientes.FK_PESSOA
    )

    , joined2 as (
        select 
            joined.*
            , lojas.NM_ENTIDADE as NM_LOJA
        from joined
        left join lojas on joined.fk_loja = lojas.pk_entidade
    )

select *
from joined2
