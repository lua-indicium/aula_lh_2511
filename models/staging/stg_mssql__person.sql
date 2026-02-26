  with
    source as (
        select *
        from {{ source('raw_person', 'raw__s3_person_person') }}
    )

    , renamed as (
        select
            cast(businessentityid as int) as business_entity_id
            , case
                when persontype = 'IN' then 'Customer'
                when persontype = 'SC' then 'Store Contact'
                when persontype = 'SP' then 'Sales Person'
                when persontype = 'EM' then 'Employee'
                when persontype = 'VC' then 'Vendor Contact'
                when persontype = 'GC' then 'General Contact'
            end as person_type
            , cast(namestyle as boolean) as name_style
            , cast(title as string) as person_title
            , cast(firstname as string) as person_first_name
            , cast(middlename as string) as person_middle_name
            , cast(lastname as string) as person_last_name
            , concat(
                coalesce(firstname, '')
                , ' '
                , coalesce(middlename, '')
                , ' '
                , coalesce(lastname, '')
            ) as person_full_name
            , cast(suffix as string) as person_suffix
            , cast(emailpromotion as string) as email_promotion
            , cast(additionalcontactinfo as string) as additional_contact_info
            , cast(demographics as string) as demographics
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as date) as updated_at
            , 'Microsoft SQL Server' as system_name
        from source
    )

select *
from renamed
