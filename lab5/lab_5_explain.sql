USE posters; -- Переконуємося, що ми у правильній БД

-- --- 1. ПІДГОТОВКА ---
-- Видаляємо індекс, якщо він існував з минулого разу.
-- Це дозволяє нам запускати цей скрипт повторно для "чистого" тесту.
DROP INDEX IF EXISTS idx_order_status ON `Order`;


-- --- 2. ПЛАН "ДО" ---
-- Отримуємо план запиту, коли індексу по полю `status` ще немає.
-- Очікуємо побачити: type: ALL (Full Table Scan)
EXPLAIN SELECT * FROM `Order` WHERE `status` = 'Pending';


-- --- 3. СТВОРЕННЯ ІНДЕКСУ ---
-- Створюємо індекс, який оптимізує пошук за статусом
CREATE INDEX idx_order_status ON `Order` (status);


-- --- 4. ПЛАН "ПІСЛЯ" ---
-- Знову отримуємо план для ТОГО САМОГО запиту.
-- Тепер, коли індекс існує, очікуємо побачити:
-- type: ref, key: idx_order_status
EXPLAIN SELECT * FROM `Order` WHERE `status` = 'Pending';
