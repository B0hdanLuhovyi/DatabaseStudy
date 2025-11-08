USE `posters`;

-- 1. Додаємо колонку для збереження дати останнього оновлення
ALTER TABLE `Product`
ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL
AFTER `categoryId`;

-- Змінюємо стандартний роздільник
DELIMITER //

-- 2. Створення тригера, який спрацьовує перед оновленням запису
CREATE TRIGGER `trg_Product_BeforeUpdate`
BEFORE UPDATE ON `Product`
FOR EACH ROW
BEGIN
    -- Оновлюємо дату зміни при кожному редагуванні рядка
    SET NEW.updated_at = NOW();
END //
-- Кінець тригера

-- Повертаємо стандартний роздільник
DELIMITER ;
