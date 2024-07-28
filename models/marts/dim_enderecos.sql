with
    endereco as (
        select *
        from {{ ref('stg_erp__enderecos') }}
    )

    , provincia as (
        select *
        from {{ ref('stg_erp__provincias') }}
    )

    , pais as (
        select *
        from {{ ref('stg_erp__pais') }}
    )

    , territorio as (
        select *
        from {{ ref('stg_erp__territorios') }}
    )

    , joined as (
        select
            endereco.PK_ENDERECO
            , endereco.NM_ENDERECO1
            , endereco.NM_ENDERECO2
            , endereco.NM_CIDADE
            , endereco.NM_CAIXA_POSTAL
            --, provincia.PK_COD_PROVINCIA
            --, provincia.FK_COD_PAIS
            , provincia.NM_PROVINCIA
            , pais.NM_PAIS  
            , territorio.NM_TERRITORIO
            , territorio.NM_GRUPO_TERRITORIO                      
        from endereco
        left join provincia on endereco.fk_provincia = provincia.pk_provincia
        left join pais on provincia.fk_cod_pais = pais.pk_cod_pais
        left join territorio on provincia.fk_territorio = territorio.pk_territorio
    )

    select *
    from joined