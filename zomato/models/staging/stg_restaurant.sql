SELECT 
  id::number as restaurant_id,
  name as restaurant_name,
  -- ^ negasi, akan berhenti ketika ada karakter , + $
  -- mksd: ambil semua karakter kecuali jika bertemu tanda , + $ 
  trim(coalesce(regexp_substr(city, '[^,+$]'), city)) as city, 
  try_to_decimal(nullif(rating, '--', 3, 1)) as rating,
  -- ambil semua angka 0-9 dan (+) -> seterusnya sampai bertemu yg bukan 0-9
  try_to_number(regexp_substr(rating_count, '[0-9]+')) as rating_count,
  try_to_number(regexp_substr(cost, '[0-9]+')) as cost_for_two,
  cuisine, lic_no as license_no
FROM {{ source('raw', 'restaurant')}} 
WHERE
  try_to_number(id) is not null
