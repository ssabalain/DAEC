with source as (

  select * from {{ ref("globepay_acceptance_report") }}

),

renamed as (

  select
    external_ref as transaction_id,
    date_time as transaction_timestamp,
    state as transaction_state,
    cvv_provided as is_cvv_provided,
    currency as local_currency,
    amount as amount_local_currency,

    {{ convert_currency(
        amount_field = 'amount',
        origin_currency_field = 'currency',
        exchange_rates_dict = 'rates'
    ) }} as amount_usd,

    {{ get_country_name_by_iso_code(
        iso_code_country_field = 'country'
    ) }} as country_of_origin

  from source

)

select * from renamed