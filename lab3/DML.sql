-- DML: Додавання нового користувача (User)
INSERT INTO posters.`Client` (name, email, hash) VALUES
('ian', '1@gmail.com', 'aaa'),
('liza', '2@gmail.com', 'aa'),
('dima', '3@hneu.com', 'aa'),
('boghdan', '4@hneu.com', 'aaa'),
('rodion', '5@gmail.com', 'aaa'),
('sergey', '6@gopo.com', 'aaa');

-- DML: Додавання нових товарів (Product)
INSERT INTO posters.`Product` (`name`, `description`, `price`, `quantity`, `categoryId`) VALUES
("Terminator 3","description",100,510,1),
("Terminator 4","description",610,1067,1),
("Terminator 5","description",170,160,1),
("Terminator 6","description",106,106,1),
("Terminator 7","description",1054,140,1);

-- DML: Оновлення ціни товару (Update)
UPDATE posters.`Product`
SET `price` = 111111111111
WHERE `name` = 'Terminator 4';

-- DML: Видалення позицій з замовлення (Delete)
DELETE FROM posters.`Cart`
WHERE `orderId` = 1 AND `productId` > 3;

-- DQL: Фільтрація (WHERE + AND)
SELECT *
FROM posters.`Product`
WHERE `categoryId` = 1 AND `price` < 500;

-- DQL: Фільтрація (WHERE + IN)
SELECT *
FROM posters.`Order`
WHERE `status` IN ('shipped', 'completed');

-- DQL: Фільтрація (WHERE + LIKE)
SELECT *
FROM posters.`Client`
WHERE `email` LIKE '%@gmail.com';

-- DQL: Сортування (ORDER BY)
SELECT *
FROM posters.`Product`
ORDER BY `price` DESC;
