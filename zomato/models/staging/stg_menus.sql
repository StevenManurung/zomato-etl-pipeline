SELECT 
  menu_id::NUMBER AS menu_id,
  r_id::NUMBER AS restaurant_id,
  f_id::NUMBER AS food_id,
  TRIM(cuisine) AS cuisine,
  try_to_number(price) AS price
FROM 
  {{source('raw', 'menu')}}
WHERE
  try_to_number(menu_id) IS NOT NULL