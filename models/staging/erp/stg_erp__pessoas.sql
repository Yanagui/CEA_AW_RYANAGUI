with
    fonte_pessoas as (
        select 
            cast(BUSINESSENTITYID as int) as pk_entidade
            , cast(TITLE as varchar) as nm_titulo
            , cast(FIRSTNAME as varchar) as nm_p_nome
            , cast(MIDDLENAME as varchar) as nm_m_nome
            , cast(LASTNAME as varchar) as nm_u_nome
            , cast(SUFFIX as varchar) as nm_sufixo
            , case 
                when nm_m_nome is null then concat(nm_p_nome, ' ', nm_u_nome) 
                when nm_m_nome is not null then concat(nm_p_nome, ' ', nm_m_nome, ' ', nm_u_nome) 
            end as nm_cliente
        from {{ source('erp', 'person') }}
    )

select * 
from fonte_pessoas