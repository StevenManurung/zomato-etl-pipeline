SELECT 
  f_id::NUMBER AS food_id,
  item,
  try_to_number(veg_or_non_veg) AS veg_or_non_veg
FROM
  {{source('raw', 'food')}}
WHERE try_to_number(f_id) IS NOT NULL