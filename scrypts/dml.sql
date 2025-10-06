USE posters;

INSERT INTO Client (name, email, hash)
VALUES
('Иван Иванов', 'ivan@example.com', 'hash123'),
('Анна Смирнова', 'anna@example.com', 'hash456'),
('Петр Сидоров', 'petr@example.com', 'hash789');

INSERT INTO Category (name, description)
VALUES
('Фильмы', 'Плакаты к известным фильмам'),
('Музыка', 'Постеры музыкальных групп и исполнителей'),
('Игры', 'Постеры по видеоиграм');

INSERT INTO Product (name, description, price, quantity, categoryId)
VALUES
('Постер "Inception"', 'Постер фильма Начало (Inception)', 299.99, 10, 1),
('Постер "The Beatles"', 'Классический постер группы The Beatles', 249.50, 15, 2),
('Постер "Cyberpunk 2077"', 'Постер из игры Cyberpunk 2077', 349.00, 8, 3);

INSERT INTO `Order` (status, clientId)
VALUES
('Создан', 1),
('В обработке', 2),
('Доставлен', 3);

INSERT INTO Cart (orderId, productId, productPrice, productQuantity)
VALUES
(1, 1, 299.99, 1),
(1, 2, 249.50, 2),  
(2, 3, 349.00, 1),   
(3, 1, 299.99, 1),   
(3, 3, 349.00, 1);   
