GRANT SELECT ON posters.`Category` TO 'APP_backend'@'localhost';
GRANT SELECT on posters.`Client` TO 'APP_backend'@'localhost';
-- 3. Дозволяємо ЧИТАТИ ТА СТВОРЮВАТИ замовлення
-- (але не видаляти і не редагувати!)
GRANT SELECT, INSERT ON posters.`Order` TO 'APP_backend'@'localhost';
GRANT SELECT, INSERT ON posters.`Cart` TO 'APP_backend'@'localhost';
-- 4. Застосовуємо зміни
FLUSH PRIVILEGES;
