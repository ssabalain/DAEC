with transactions as (

  select * from {{ ref('base_globepay__transactions') }}

),

chargeback_information as (

  select * from {{ ref('base_globepay__chargeback_information') }}

)

select * from transactions
left join chargeback_information using (transaction_id)