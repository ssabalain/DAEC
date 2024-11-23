with transactions as (

  select * from {{ ref('stg_globepay__transactions') }}

)

select
  transaction_id,
  transaction_timestamp,
  amount_local_currency,
  amount_usd

from transactions