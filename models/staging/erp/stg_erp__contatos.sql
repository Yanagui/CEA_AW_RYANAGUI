with
    fonte_contatos as (
        select
            cast(BUSINESSENTITYID as int) as pk_entidade
            , cast(PERSONID as int) as pk_pessoa
            , cast(CONTACTTYPEID as int) as pk_tipo_contato
        from {{ source('erp', 'businessentitycontact') }}
    )

select * 
from fonte_contatos