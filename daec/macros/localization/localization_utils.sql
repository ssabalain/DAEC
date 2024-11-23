{% macro convert_currency(
    amount_field,
    origin_currency_field,
    exchange_rates_dict,
    destination_currency = 'USD'
) %}

    (
      cast(cast({{ exchange_rates_dict }} as json)->>'{{ destination_currency }}' as float)/
      cast(cast({{ exchange_rates_dict }} as json)->>{{ origin_currency_field }} as float)
    ) * {{ amount_field }}

{% endmacro %}

{% macro get_country_name_by_iso_code(iso_code_country_field) %}

    {%- set iso_codes_mapping = get_iso_codes_mapping() | tojson -%}

    cast( '{{ iso_codes_mapping }}' as json) ->> {{ iso_code_country_field }}

{% endmacro %}