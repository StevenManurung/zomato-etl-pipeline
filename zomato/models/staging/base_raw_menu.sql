with source as (
        select * from {{ source('raw', 'menu') }}
  ),
  renamed as (
      select
        {{ adapter.quote("_IDX") }},
        {{ adapter.quote("MENU_ID") }},
        {{ adapter.quote("R_ID") }},
        {{ adapter.quote("F_ID") }},
        {{ adapter.quote("CUISINE") }},
        {{ adapter.quote("PRICE") }}

      from source
  )
  select * from renamed
    