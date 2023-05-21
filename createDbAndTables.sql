drop database IF EXISTS `mist_middle`;

create database `mist_middle`;

use `mist_middle`;

CREATE TABLE `products` (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(30) NOT NULL,
    productDescription VARCHAR(500),
    productCategory VARCHAR(10) not null,
    ProductUnit VARCHAR(10) not null,
    ProductUnitQuantity VARCHAR(30) not null,
    productUnitPrice VARCHAR(30) NOT NULL
);

CREATE TABLE `users` (
  userId INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(30) NOT NULL UNIQUE,
  firstName varchar(20) NOT NULL,
  middleName varchar(20) DEFAULT NULL,
  lastname varchar(20) NOT NULL,
  mobileNumber varchar(15) NOT NULL UNIQUE,
  email varchar(30) NOT NULL UNIQUE,
  gender varchar(3) NOT NULL,
  address VARCHAR(30) NOT NULL,
  pincode INT NOT NULL
);

CREATE TABLE `shadow` (
    userId INT PRIMARY KEY,
    password VARCHAR(100),
    FOREIGN KEY (userId)
        REFERENCES users (userId)
);

CREATE TABLE `orders` (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    totalPrice INT NOT NULL
);	

create Table `blogs`(
	blogId INT AUTO_INCREMENT PRIMARY KEY,
    title varchar(200) unique not null,
    content varchar(5000) not null,
    image varchar(500) not null,
    pCount INT NOT NULL DEFAULT 0
);