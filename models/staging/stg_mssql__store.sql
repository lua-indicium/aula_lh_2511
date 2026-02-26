with
    source as (
        select *
        from {{ source('raw_sales', 'raw__sales_store') }}
    )

    , renamed as (
        select
            cast(businessentityid as int) as store_id
            , cast(name as string) as store_name
            , cast(salespersonid as int) as sales_person_id
            , cast(demographics as string) as demographics
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as date) as updated_at
            , 'Microsoft SQL Server' as system_name
        from source
    )

select *
from renamed
