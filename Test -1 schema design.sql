
drop database if exists shopping_management;
create database shopping_management;
use shopping_management;
create table customers(
       customer_id int auto_increment primary key,
       customer_name varchar(100) not null,
       Email varchar(255) unique,
       phone_number char(100) not null unique,
       age int check ( age > 0),
       gender enum('male', 'female','other'),
       counrty varchar(50) default 'india',
       city varchar(50) not null,
       pincode char(6) default '201301',
       registration_date date default (current_date),
       registration_time date default (current_time),
       created_at timestamp default (current_timestamp),
       address varchar(250),
       customer_status enum('active', 'inactive', 'block') default 'active',
       customer_notes tinytext
) engine= InnoDB; 


  CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE DEFAULT (CURRENT_DATE),
    order_amount DECIMAL(10,2) NOT NULL,
    order_status ENUM('pending', 'processing', 'shipped', 'cancelled') DEFAULT 'pending',
    payment_method ENUM('cash', 'card', 'UPI', 'net banking'),
    payment_status ENUM('pending', 'paid', 'failed') DEFAULT 'pending',
    shipping_address VARCHAR(250) NOT NULL,
    delivery_pincode CHAR(6),
    quantity INT NOT NULL,
    discount_amount DECIMAL(10,2) DEFAULT 0,
    delivery_date DATE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tracking_number VARCHAR(30) UNIQUE,
    delivery_status ENUM('not dispatched', 'in transit', 'delivered', 'returned') DEFAULT 'not dispatched',
    order_notes TINYINT,
        constraint fk_orders_customers
        FOREIGN KEY (Customer_Id)
        REFERENCES customers(Customer_Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

 SHOW TABLES;

DESCRIBE customers;

DESCRIBE orders;