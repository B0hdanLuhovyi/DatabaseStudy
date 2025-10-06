use posters;

CREATE TABLE `Client` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `email` varchar(100) UNIQUE,
  `hash` varchar(256) NOT NULL,
  `date` timestamp NOT NULL DEFAULT now()
);

CREATE TABLE `Category` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(64) UNIQUE,
  `description` text NOT NULL
);

CREATE TABLE `Product` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(64) UNIQUE,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` integer NOT NULL DEFAULT 0,
  `categoryId` integer NOT NULL
);

CREATE TABLE `Order` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `status` varchar(32) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT now(),
  `clientId` integer NOT NULL
);

CREATE TABLE `Cart` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `orderId` integer NOT NULL,
  `productId` integer NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productQuantity` integer NOT NULL
);

ALTER TABLE `Product` ADD FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`);

ALTER TABLE `Cart` ADD FOREIGN KEY (`orderId`) REFERENCES `Order` (`id`);

ALTER TABLE `Cart` ADD FOREIGN KEY (`productId`) REFERENCES `Product` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`clientId`) REFERENCES `Client` (`id`);
