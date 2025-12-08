WITH payment as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        status,
        amount,
        created,
        _batched_at
        
    from {{ source('stripe', 'payment') }}
    -- dbt_raw.stripe.payment

)
select * from payment