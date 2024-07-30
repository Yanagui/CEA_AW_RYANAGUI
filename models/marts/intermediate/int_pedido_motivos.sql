with
    pedido_motivos as (
        select *
        from {{ ref('stg_erp__pedido_motivos') }}
    )

    , motivo_tipos as (
        select *
        from {{ ref('stg_erp__pedido_motivo_tipos') }}
    )

    , ajuste_tabela as (
        select
            FK_PEDIDO
            , sum(1) as Contagem_Motivo
            , min(FK_MOTIVO) as Minimo_Motivo
            , max(FK_MOTIVO) as Maximo_Motivo
            , max(
                case 
                    when FK_MOTIVO = 2 then 2
                    when FK_MOTIVO <> 2 then FK_MOTIVO
                end) as FK_MOTIVO2
        from pedido_motivos
        group by fk_pedido
    )

    , joined as (
        select
            ajuste_tabela.*
            , motivo_tipos.NM_MOTIVO
            , motivo_tipos.NM_MOTIVO_TIPO
        from ajuste_tabela
        left join motivo_tipos on ajuste_tabela.FK_MOTIVO2 = motivo_tipos.PK_MOTIVO
    )

select * from joined