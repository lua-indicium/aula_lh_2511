with
    stores as (
        select *
        from {{ ref('stg_mssql__store') }}
    )

    , address as (
        select *
        from {{ ref('stg_mssql__address') }}
    )

    , joined as (
        select
            stores.store_id
            , stores.store_name
            , address.city
            , address.state_province_id
            , stores.updated_at
            , current_timestamp as loaded_at
        from stores
        left join address
            on stores.store_id = address.address_id

)

select *
from joined
