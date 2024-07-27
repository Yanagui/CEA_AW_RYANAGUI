with
    fonte_contatos as (
        select
            cast(PERSONID as int) as pk_pessoa
            , cast(BUSINESSENTITYID as int) as fk_entidade
            , cast(CONTACTTYPEID as int) as fk_tipo_contato
        from {{ source('erp', 'businessentitycontact') }}
    )

select * 
from fonte_contatos