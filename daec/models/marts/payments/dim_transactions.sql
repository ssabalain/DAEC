with transactions as (

  select * from {{ ref('stg_globepay__transactions') }}

)

select
  transaction_id,
  transaction_state,
  country_of_origin,
  is_cvv_provided,
  local_currency,
  has_chargeback

from transactions