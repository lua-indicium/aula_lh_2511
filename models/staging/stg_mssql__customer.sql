with
    source as (
        select *
        from {{ source('raw_sales', 'raw__sales_customer') }}
    )

    , renamed as (
        select
            cast(customerid as int) as customer_id
            , cast(personid as int) as person_id
            , cast(storeid as int) as store_id
            , cast(territoryid as int) as territory_id
            , cast(accountnumber as string) as account_number
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as date) as updated_at
            , 'Microsoft SQL Server' as system_name
        from source
    )

select *
from renamed
