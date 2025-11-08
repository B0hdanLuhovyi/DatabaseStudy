USE `posters`;

-- Змінюємо стандартний роздільник
DELIMITER //

-- 1. Створення процедури "Додати Новий Товар"
CREATE PROCEDURE `sp_AddNewProduct`(
    IN p_name VARCHAR(64),           -- Назва товару
    IN p_description TEXT,           -- Опис товару
    IN p_price DECIMAL(10,2),        -- Ціна
    IN p_quantity INT,               -- Кількість
    IN p_categoryId INT              -- Ідентифікатор категорії
)
BEGIN
    -- Вставка нового запису у таблицю Product
    INSERT INTO `Product` (`name`, `description`, `price`, `quantity`, `categoryId`)
    VALUES (p_name, p_description, p_price, p_quantity, p_categoryId);
END //
-- Кінець процедури

-- Повертаємо стандартний роздільник
DELIMITER ;
