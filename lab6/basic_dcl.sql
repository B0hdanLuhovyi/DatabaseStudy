-- 1. Створюємо нового користувача 'WEB_client'
-- Він зможе підключатися тільки з локального комп'ютера ('localhost')
CREATE USER 'WEB_client'@'localhost' IDENTIFIED BY 'secure_pass_123';
-- 2. Надаємо йому право ТІЛЬКИ ЧИТАТИ (SELECT) дані
-- з таблиці Products. До інших таблиць доступу не буде.
GRANT SELECT ON posters.`Product` TO 'web_client'@'localhost';
-- 3. Оновлюємо таблиці привілеїв, щоб зміни вступили в силу миттєво
FLUSH PRIVILEGES;
