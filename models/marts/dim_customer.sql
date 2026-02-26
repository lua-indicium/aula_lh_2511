with
    customers as (
        select *
        from {{ ref('stg_mssql__customer') }}
    )

    , person as (
        select *
        from {{ ref('stg_mssql__person') }}
    )

    , address as (
        select *
        from {{ ref('stg_mssql__address') }}
    )

    , joined as (
        select
            customers.customer_id
            , customers.account_number
            , customers.store_id
            , person.person_full_name as customer_name
            , address.city
            , address.state_province_id
            , customers.updated_at
            , current_timestamp as loaded_at
        from customers
        left join person
            on customers.person_id = person.business_entity_id
        left join address
            on customers.customer_id = address.address_id
    )

select *
from joined