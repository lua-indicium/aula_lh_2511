with

    orders as (

        select *
        from {{ ref('int_order') }}

    )

    , customers as (

        select *
        from {{ ref('dim_customer') }}

    )

    , stores as (

        select *
        from {{ ref('dim_store') }}

    )

    , fact_base as (

        select
            orders.sales_order_id
            , orders.order_date
            , orders.customer_id
            , orders.order_qty
            , orders.unit_price
            , orders.subtotal
            , orders.tax_amount
            , orders.freight

            -- métricas simples
            , (orders.subtotal + orders.tax_amount + orders.freight) as total_amount
            , current_timestamp as loaded_at

        from orders
        left join customers
            on orders.customer_id = customers.customer_id
        left join stores
            on customers.store_id = stores.store_id

    )

select *
from fact_base