with
    source as (
        select *
        from {{ source('raw_sales', 'raw__sales_salesorderdetail') }}
    )

    , renamed as (
        select
            cast(salesorderid as int) as sales_order_id
            , cast(salesorderdetailid as int) as sales_order_detail_id
            , cast(carriertrackingnumber as string) as carrier_tracking_number
            , cast(orderqty as int) as order_qty
            , cast(productid as int) as product_id
            , cast(specialofferid as int) as special_offer_id
            , cast(unitprice as float) as unit_price
            , cast(unitpricediscount as float) as unit_price_discount
            , cast(linetotal as float) as subtotal
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as date) as updated_at
            , 'Microsoft SQL Server' as system_name
        from source
    )

select *
from renamed
