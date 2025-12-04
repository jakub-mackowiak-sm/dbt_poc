WITH fct_orders as (
    SELECT
    raw_orders.order_id,
    raw_orders.customer_id,
    sum(raw_payment.amount) as amount

    FROM {{ ref('raw_orders') }} raw_orders
    left join {{ ref('raw_payment') }} raw_payment using (order_id) 

    GROUP BY 1, 2
)

SELECT * FROM fct_orders