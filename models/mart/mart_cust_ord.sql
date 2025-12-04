WITH final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        fct_orders.amount as lifetime_value

    from {{ ref('raw_customers') }} customers

    left join {{ ref('agg_customer_orders') }} customer_orders using (customer_id) 
    left join {{ ref('fct_orders') }} fct_orders using (customer_id)

)

select * from final