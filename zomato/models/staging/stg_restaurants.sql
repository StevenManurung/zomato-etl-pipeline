SELECT 
  id::number AS restaurant_id,
  name AS restaurant_name,
  -- ^ negasi, akan berhenti ketika ada karakter , + $
  -- mksd: ambil semua karakter kecuali jika bertemu tanda , + $ 
  trim(coalesce(regexp_substr(city, '[^,+$]'), city)) AS city, 
  try_to_decimal(nullif(rating::varchar, '--'), 3, 1) AS rating,
  -- ambil semua angka 0-9 dan (+) -> seterusnya sampai bertemu yg bukan 0-9
  try_to_number(regexp_substr(rating_count, '[0-9]+')) AS rating_count,
  try_to_number(regexp_substr(cost, '[0-9]+')) AS cost_for_two,
  cuisine, lic_no AS license_no
FROM 
  {{ source('raw', 'restaurants')}} 
WHERE
  try_to_number(id) IS NOT NULL