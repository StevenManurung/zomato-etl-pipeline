SELECT
  order_item_id :: NUMBER AS order_item_id,
  TRY_TO_NUMBER(order_id) as order_id,
  TRY_TO_NUMBER(r_id) AS restaurant_id,
  f_id AS food_id,
  TRY_TO_NUMBER(price) AS price,
  TRY_TO_NUMBER(quantity) AS quantity,
  TRY_TO_NUMBER(line_amount) AS line_amount
FROM
  {{ source('raw','order_items') }}
WHERE
  TRY_TO_NUMBER(order_item_id) IS NOT NULL