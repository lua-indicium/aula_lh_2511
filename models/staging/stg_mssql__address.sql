with
    address_source as (
        select *
        from {{ source('raw_person', 'raw__person_address') }}
    )

    , renamed as (
        select
            cast(addressid as int) as address_id
            , cast(addressline1 as string) as address_line_1
            , cast(addressline2 as string) as address_line_2
            , cast(city as string) as city
            , cast(stateprovinceid as int) as state_province_id
            , cast(postalcode as string) as postal_code
            , cast(modifieddate as date) as updated_at
            , 'Microsoft SQL Server' as system_name
        from address_source
    )

select *
from renamed
