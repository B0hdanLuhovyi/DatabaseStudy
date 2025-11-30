-- Перетворюємо дані користувача з id=1 на JSON-об'єкт
SELECT 
JSON_OBJECT(
'clientId', c.id, -- Ключ 'clientId' : Значення з колонки id
'fullName', c.name, -- Ключ 'fullName' : Значення з колонки name
'contactEmail', c.email -- Ключ 'contactEmail' : Значення з колонки email
) AS client_json_data
FROM 
posters.`client` as c 
WHERE 
c.id = 1;
