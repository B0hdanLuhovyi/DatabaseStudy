/*
 * =================================================================
 * 1. Бізнес-транзакція (Виправлена через Збережену Процедуру)
 *
 * Помилка [1064] ... near '' виникала тому, що логіку IF/THEN/ELSE
 * не можна запускати як простий SQL-скрипт.
 * Це рішення обгортає всю логіку в збережену процедуру.
 * =================================================================
 */

-- Видаляємо процедуру, якщо вона вже існує (щоб уникнути помилки при повторному запуску)
DROP PROCEDURE IF EXISTS sp_CreateOrder;

-- Змінюємо роздільник, щоб MySQL/MariaDB
-- не думав, що процедура закінчилася на першій ';'
DELIMITER //

CREATE PROCEDURE sp_CreateOrder (
    IN p_client_id INT,
    IN p_product_id INT,
    IN p_quantity_to_buy INT
)
BEGIN
    -- Декларуємо локальні змінні
    DECLARE current_stock INT DEFAULT 0;
    DECLARE product_price DECIMAL(10, 2) DEFAULT 0.0;
    DECLARE last_order_id INT DEFAULT 0;

    -- Декларуємо обробник помилок:
    -- Якщо будь-який запит усередині блоку зазнає невдачі,
    -- вся транзакція буде автоматично скасована (ROLLBACK).
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'An SQL error occurred. Transaction rolled back.' AS message;
    END;

    -- Початок транзакції
    START TRANSACTION;

    -- 1. Блокуємо рядок товару та перевіряємо залишок
    -- (Використовуємо p_product_id з параметрів процедури)
    SELECT `quantity` INTO current_stock
    FROM posters.`Product`
    WHERE `id` = p_product_id FOR UPDATE;

    -- 2. Перевіряємо, чи достатньо товару
    IF current_stock >= p_quantity_to_buy THEN

        -- 3. Створюємо новий запис в 'Order'
        INSERT INTO posters.`Order` (`status`, `clientId`)
        VALUES ('Pending', p_client_id);

        -- 4. Отримуємо ID щойно створеного замовлення
        SET last_order_id = LAST_INSERT_ID();

        -- 5. Отримуємо ціну товару
        SELECT `price` INTO product_price
        FROM posters.`Product`
        WHERE `id` = p_product_id;

        -- 6. Додаємо товар до 'кошика' (деталі замовлення)
        INSERT INTO posters.`Cart` (`orderId`, `productId`, `productPrice`, `productQuantity`)
        VALUES (last_order_id, p_product_id, product_price, p_quantity_to_buy);

        -- 7. Оновлюємо (зменшуємо) залишки товару
        UPDATE posters.`Product`
        SET `quantity` = `quantity` - p_quantity_to_buy
        WHERE `id` = p_product_id;

        -- 8. Якщо все успішно, підтверджуємо транзакцію
        COMMIT;
        SELECT 'Transaction committed successfully.' AS message;

    ELSE
        -- 9. Якщо товару недостатньо, скасовуємо транзакцію
        ROLLBACK;
        SELECT 'Transaction rolled back. Insufficient stock.' AS message;
    END IF;

END //

-- Повертаємо роздільник до стандартного
DELIMITER ;

/*
 * =================================================================
 * ВИКОНАННЯ ТРАНЗАКЦІЇ:
 *
 * Тепер, замість запуску всього скрипту, ви просто
 * викликаєте процедуру, яку ми створили.
 * =================================================================
 */

-- Запускаємо транзакцію: (Клієнт 1, Товар 1, Кількість 2)
-- Змініть ці значення, щоб протестувати
CALL sp_CreateOrder(1, 1, 2);
