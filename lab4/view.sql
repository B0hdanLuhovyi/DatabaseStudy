use `Posters`;
-- 1. Створення представлення "Деталізовані Замовлення"
-- Це представлення об'єднує 4 таблиці
-- для створення готового звіту про продажі
CREATE VIEW `v_Detailed_Orders` AS
SELECT
    o.id AS `order_id`,
    o.status AS `order_status`,
    o.createdate AS `order_date`,
    u.name AS `customer_name`,
    u.email AS `customer_email`,
    p.name AS `product_name`,
    p.price AS `product_price`,
    oi.productquantity,
    oi.productprice as price -- Ціна, за якою товар був куплений
FROM
    `Order` AS o
JOIN
    `Client` AS u ON o.clientid = u.id
JOIN
    `Cart` AS oi ON o.id = oi.orderid
JOIN
   `Product` AS p ON oi.productid = p.id
ORDER BY
    o.id DESC;
