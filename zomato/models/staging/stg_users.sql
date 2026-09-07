SELECT
  user_id::number AS customer_id,
  TRIM(name) AS customer_name,
  LOWER(email) AS email,
  try_to_number(age) AS age,
  gender,
  marital_status,
  occupation,
  monthly_income AS income_band,
  educational_qualifications AS educational,
  try_to_number(family_size) AS family_size
FROM
  {{source('raw', 'users')}}
WHERE
  try_to_number(user_id) IS NOT NULL