with fct_trasactions as (

  select * from {{ ref('fct_transaction__created') }}

),

dim_transactions as (

  select * from {{ ref('dim_transactions') }}

),

transactions_with_aux_fields as (

  select
    transaction_id,
    transaction_timestamp::date as transaction_date,
    country_of_origin,

    case
      when transaction_state = 'ACCEPTED' then true
      else false
    end as is_accepted,

    1 as total_count,

    case
      when transaction_state = 'ACCEPTED' then 1
      else 0
    end as accepted_count,

    case
      when has_chargeback is null then true
      else false
    end as miss_chargeback_information,

    amount_usd

  from fct_trasactions
  left join dim_transactions using (transaction_id)

)

select * from transactions_with_aux_fields