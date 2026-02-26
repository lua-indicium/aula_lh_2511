with
    source as (
        select *
        from {{ source('raw_sales', 'raw__sales_salesorderheader') }}
    )

    , renamed as (
        select
            cast(salesorderid as int) as sales_order_id
            , cast(revisionnumber as int) as revision_number
            , cast(orderdate as date) as order_date
            , cast(duedate as date) as due_date
            , cast(shipdate as date) as ship_date
            , cast(status as int) as order_status
            , cast(onlineorderflag as boolean) as online_order_flag
            , cast(salesordernumber as string) as sales_order_number
            , cast(purchaseordernumber as string) as purchase_order_number
            , cast(accountnumber as string) as account_number
            , cast(customerid as int) as customer_id
            , cast(salespersonid as int) as sales_person_id
            , cast(territoryid as int) as territory_id
            , cast(billtoaddressid as int) as customer_bill_to_address_id
            , cast(shiptoaddressid as int) as customer_ship_to_address_id
            , cast(shipmethodid as int) as ship_method_id
            , cast(creditcardid as int) as credit_card_id
            , cast(creditcardapprovalcode as string) as credit_card_approval_code
            , cast(currencyrateid as int) as currency_rate_id
            , cast(subtotal as float) as subtotal
            , cast(taxamt as float) as tax_amount
            , cast(freight as float) as freight
            , cast(totaldue as float) as total_due
            , cast(comment as string) as sales_representative_comment
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as date) as updated_at
            , 'Microsoft SQL Server' as system_name
        from source
    )

select *
from renamed
