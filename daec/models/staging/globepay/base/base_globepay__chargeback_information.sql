with source as (

  select * from {{ ref("globepay_chargeback_report") }}

),

renamed as (

  select
    external_ref as transaction_id,
    chargeback as has_chargeback

  from source

)

select * from renamed