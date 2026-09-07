SELECT
  review_id::NUMBER AS review_id,
  TRY_TO_NUMBER(order_id) AS order_id,
  TRY_TO_NUMBER(user_id) AS customer_id,
  TRY_TO_NUMBER(restaurant) AS restaurant_id,
  rating,
  comment,
  CAST(review_date AS DATE) AS review_date
FROM 
  {{source('raw', 'reviews')}}
WHERE
  try_to_number(review_id) IS NOT NULL