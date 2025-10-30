USE posters;

INSERT INTO Client (name, email, hash)
VALUES
('IVAN', 'ivan@example.com', 'hash123'),
('Ann', 'anna@example.com', 'hash456'),
('PETTER', 'petr@example.com', 'hash789');

INSERT INTO Category (id, name, description)
VALUES
(7, 'FILMS', 'films description'),
(8, 'MUSIC', 'music description'),
(9, 'GAMES', 'games description');

INSERT INTO Product (name, description, price, quantity, categoryId)
VALUES
('Poster "Inception"', 'film Inception', 299.99, 10, 7),
('Poster "The Beatles"', 'Clasic poster The Beatles', 249.50, 15, 8),
('Poster "Cyberpunk 2077"', 'poster of Cyberpunk 2077', 349.00, 8, 9);

INSERT INTO `Order` (status, clientId)
VALUES
('CREATE', 1),
('Not Sucese', 2),
('Sucese', 3);

INSERT INTO Cart (orderId, productId, productPrice, productQuantity)
VALUES
(1, 1, 299.99, 1),
(1, 2, 249.50, 2),  
(2, 3, 349.00, 1),   
(3, 1, 299.99, 1),   
(3, 3, 349.00, 1);   
