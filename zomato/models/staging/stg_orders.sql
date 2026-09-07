SELECT
  order_id :: NUMBER AS order_id,
  user_id :: NUMBER AS customer_id,
  r_id :: NUMBER AS restaurant_id,
  restaurant_city,
  cuisine,
  TRY_TO_NUMBER(items_count) AS items_count,
  TRY_TO_NUMBER(sales_qty) AS sales_quantity,
  TRY_TO_NUMBER(subtotal) AS subtotal,
  TRY_TO_NUMBER(discount) AS discount,
  TRY_TO_NUMBER(delivery_fee) AS delivery_fee,
  TRY_TO_NUMBER(gst) AS gst,
  TRY_TO_NUMBER(sales_amount) AS sales_amount,
  currency,
  payment_method,
  order_status,
  -- cara 1: ubah tipe data 
  TRY_TO_NUMBER(customer_rating) AS customer_rating,
  -- cara 2: ubah tipe data 
  TRY_TO_NUMBER(delivery_time_min) AS delivery_time_minutes,
  -- menghasilkan NULL jika format tidak sesuai 
  CAST(order_timestamp AS {{ dbt.type_timestamp() }}) AS order_timestamp,
  CAST(order_date AS DATE) AS order_date
FROM
  {{ source('raw','orders') }}
WHERE
  TRY_TO_NUMBER(order_id) IS NOT NULL
