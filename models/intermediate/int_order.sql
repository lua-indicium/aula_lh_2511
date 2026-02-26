with

sales_order as (

    select *
    from {{ ref('stg_mssql__sales_order_header') }}

)

, sales_order_detail as (

    select *
    from {{ ref('stg_mssql__sales_order_detail') }}

)

, detailed_sales_orders as (

    select
        sales_order_detail.sales_order_id
        , sales_order_detail.sales_order_detail_id
        , sales_order_detail.carrier_tracking_number
        , sales_order_detail.order_qty
        , sales_order_detail.product_id
        , sales_order_detail.special_offer_id
        , sales_order_detail.unit_price
        , sales_order_detail.unit_price_discount
        , sales_order_detail.subtotal

        , sales_order.revision_number
        , sales_order.order_date
        , sales_order.due_date
        , sales_order.ship_date
        , sales_order.order_status
        , sales_order.online_order_flag
        , sales_order.sales_order_number
        , sales_order.purchase_order_number
        , sales_order.account_number
        , sales_order.customer_id
        , sales_order.sales_person_id
        , sales_order.territory_id
        , sales_order.customer_bill_to_address_id
        , sales_order.customer_ship_to_address_id
        , sales_order.ship_method_id
        , sales_order.credit_card_id
        , sales_order.credit_card_approval_code
        , sales_order.currency_rate_id

        -- Distribuição proporcional simples
        , sales_order.tax_amount
            / count(*) over (partition by sales_order_detail.sales_order_id)
            as tax_amount

        , sales_order.freight
            / count(*) over (partition by sales_order_detail.sales_order_id)
            as freight

        , sales_order_detail.updated_at
        , current_timestamp as loaded_at
        , sales_order_detail.system_name

    from sales_order_detail
    left join sales_order
        on sales_order_detail.sales_order_id = sales_order.sales_order_id

)

select *
from detailed_sales_orders