with
    fonte_pessoas as (
        select 
            cast(BUSINESSENTITYID as int) as pk_entidade
            , cast(TITLE as varchar) as nm_titulo
            , cast(FIRSTNAME as varchar) as nm_p_nome
            , cast(MIDDLENAME as varchar) as nm_m_nome
            , cast(LASTNAME as varchar) as nm_u_nome
            , cast(SUFFIX as varchar) as nm_sufixo
        from {{ source('erp', 'person') }}
    )

select * 
from fonte_pessoas