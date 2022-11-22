# drop database essential_books;
create database if not exists essential_books;
use essential_books;

CREATE TABLE IF NOT EXISTS publisher (
    publisher_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(100),
    l_name VARCHAR(100),
    phone VARCHAR(16)
);

INSERT INTO publisher (f_name, l_name, phone)
VALUES
("Jenny", "Brown", "867-5309");
INSERT INTO publisher (f_name, l_name, phone)
VALUES
("Robert", "King", "574-9856");

CREATE TABLE IF NOT EXISTS author(
    author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(100),
    l_name VARCHAR(100),
	publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id)
        REFERENCES publisher (publisher_id)
);

INSERT INTO author (f_name, l_name, publisher_id)
VALUES
("Lewis", "Stone", 1);
INSERT INTO author (f_name, l_name, publisher_id)
VALUES
("Maggie", "Long", 1);
INSERT INTO author (f_name, l_name, publisher_id)
VALUES
("Sara", "Troy", 2);

CREATE TABLE IF NOT EXISTS book (
    isbn VARCHAR(13) NOT NULL PRIMARY KEY,
    publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id)
        REFERENCES publisher (publisher_id),
    title VARCHAR(100),
    release_year INT,
    price DECIMAL(5 , 2 )
);

INSERT INTO book (isbn, publisher_id, title, release_year, price)
VALUES
("4ce5sc5ascr45", 1, "From the Depths", 1994, 14.99);
INSERT INTO book (isbn, publisher_id, title, release_year, price)
VALUES
("854795lo6584", 2, "Goosebumps", 2000, 9.99);

CREATE TABLE IF NOT EXISTS customer (
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    l_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(16),
    delivery_address VARCHAR(100),
    postal_code VARCHAR(10)
);

INSERT INTO customer (l_name, email, phone, delivery_address, postal_code)
VALUES
("Drew", "drew_123@gmail.com", "847-8569", "123 Main Street, St.John's", "A9S 9Y7");
INSERT INTO customer (l_name, email, phone, delivery_address, postal_code)
VALUES
("Power", "Megan_power@gmail.com", "548-5556", "56 Other Street, Mount Pearl", "AP9 K0Y");

CREATE TABLE IF NOT EXISTS the_order (
    order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

INSERT INTO the_order (customer_id)
VALUES
(2);
INSERT INTO the_order (customer_id)
VALUES
(2);
INSERT INTO the_order (customer_id)
VALUES
(1);

CREATE TABLE IF NOT EXISTS book_order (
    order_id INT NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    PRIMARY KEY (order_id, isbn),
    count INT,
    FOREIGN KEY (order_id)
        REFERENCES the_order (order_id),
    FOREIGN KEY (isbn)
        REFERENCES book (isbn)
);

INSERT INTO book_order (order_id, isbn, count)
VALUES
(1, "4ce5sc5ascr45", 3);
INSERT INTO book_order (order_id, isbn, count)
VALUES
(1, "854795lo6584", 1);
INSERT INTO book_order (order_id, isbn, count)
VALUES
(2, "854795lo6584", 2);

CREATE TABLE IF NOT EXISTS invoice (
    invoice_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),
    total DECIMAL(5 , 2 ),
    num_items INT,
    sale_date DATETIME
);

INSERT INTO invoice (customer_id, total, num_items, sale_date)
VALUES
(2, 19.98, 2, NOW());

SELECT * FROM author;
SELECT * FROM publisher;
SELECT * FROM book;
SELECT * FROM book_order;
SELECT * FROM the_order;
SELECT * FROM customer;
SELECT * FROM invoice;