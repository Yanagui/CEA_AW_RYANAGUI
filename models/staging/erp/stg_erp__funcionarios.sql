with
    fonte_funcionarios as (
        select
            cast(BUSINESSENTITYID as int) as pk_entidade
            , cast(JOBTITLE as varchar) as nm_cargo
        from {{ source('erp', 'employee') }}
    )

select * 
from fonte_funcionarios