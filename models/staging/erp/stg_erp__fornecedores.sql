with
    fonte_fornecedores as (
        select
            cast(BUSINESSENTITYID as int) as pk_entidade
            , cast(NAME as varchar) as nm_entidade
            , cast(ACCOUNTNUMBER as varchar) as cod_conta
        from {{ source('erp', 'vendor') }}
    )

select * 
from fonte_fornecedores