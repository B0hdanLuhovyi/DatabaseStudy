USE posters;
SELECT 
-- Створюємо JSON-об’єкт з інформацією про клієнта та всі його замовлення
JSON_OBJECT(
'client_name', c.name,
'client_email', c.email,
'all_orders',
CONCAT(
'[', -- Відкриваємо JSON-масив
GROUP_CONCAT(
-- Створюємо JSON-об’єкт для кожного замовлення
JSON_OBJECT(
'order_id', o.id,
'status', o.status,
'date', o.createDate
)
),
']' 
)
) AS client_full_data -- Даємо псевдонім результуючій JSON-колонці
FROM 
`client` AS c
JOIN 
-- Таблиця із замовленнями, об'єднуємо по зовнішньому ключу clientId
`order` AS o ON c.id = o.clientId 
WHERE 
c.id = 1
GROUP BY 
-- Групуємо по ID клієнта, щоб GROUP_CONCAT зібрав усі замовлення в один масив
c.id;
