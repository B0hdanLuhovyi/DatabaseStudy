use `posters`;
-- 1. Дивимося на ціну "ДО"
SELECT * FROM `Product` WHERE `id` = 1;

-- 2. Починаємо транзакцію
START TRANSACTION;

-- 3. Виконуємо нашу DML-операцію
UPDATE `Product`
SET `price` = 111 -- Нова ціна
WHERE `id` = 1;

-- 4. Завершуємо транзакцію ТА ЗБЕРІГАЄМО ЗМІНИ
COMMIT;

-- 5. Дивимося на ціну "ПІСЛЯ"
SELECT * FROM `Product` WHERE `id` = 1;
