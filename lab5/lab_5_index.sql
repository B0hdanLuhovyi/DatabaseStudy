-- 1. Створюємо індекс
-- idx_posters_name - це просто ім'я для нашого індексу
-- ON `Client` (`name`) - вказуємо, яку таблицю та колонку індексувати
CREATE INDEX `idx_client_name` ON posters.`client` (`name`);
