-- Drop and create the bookstore database
DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore;
USE bookstore;

-- Create the author table
CREATE TABLE IF NOT EXISTS author (
                                      id INT AUTO_INCREMENT PRIMARY KEY,
                                      first_name VARCHAR(255),
                                      last_name VARCHAR(255),
                                      birth_date DATE
);

-- Create the language table
CREATE TABLE IF NOT EXISTS language (
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        name VARCHAR(50) NOT NULL UNIQUE
);

-- Create the book table
CREATE TABLE IF NOT EXISTS book (
                                    isbn CHAR(13) PRIMARY KEY,
                                    title VARCHAR(255) NOT NULL,
                                    author_id INT NOT NULL,
                                    language_id INT NOT NULL,
                                    price DECIMAL(10, 2) NOT NULL,
                                    publication_date DATE NOT NULL,
                                    FOREIGN KEY (author_id) REFERENCES author(id),
                                    FOREIGN KEY (language_id) REFERENCES language(id)
);

-- Create the bookstore table
CREATE TABLE IF NOT EXISTS bookstore (
                                         id INT AUTO_INCREMENT PRIMARY KEY,
                                         name VARCHAR(255) NOT NULL,
                                         city VARCHAR(255) NOT NULL
);

-- Create the inventory table
CREATE TABLE IF NOT EXISTS inventory (
                                         store_id INT NOT NULL,
                                         isbn CHAR(13) NOT NULL,
                                         amount INT NOT NULL,
                                         PRIMARY KEY (store_id, isbn),
                                         FOREIGN KEY (isbn) REFERENCES book(isbn),
                                         FOREIGN KEY (store_id) REFERENCES bookstore(id)
);

-- Insert data into the author table
INSERT IGNORE INTO author (id, first_name, last_name, birth_date) VALUES
    (1, 'Chloe', 'Walsh', '1973-07-31'),
    (2, 'Rebecca', 'Yarros', '1979-05-15'),
    (3, 'Hanna', 'Grace', '1965-03-02'),
    (4, 'Michelle', 'Obama', '1964-01-17');

-- Insert data into the language table
INSERT IGNORE INTO language (id, name) VALUES
    (1, 'English'),
    (2, 'Swedish');

-- Insert data into the book table
INSERT IGNORE INTO book (isbn, title, author_id, language_id, price, publication_date) VALUES
    ('9780349439259', 'Binding 13', 1, 1, 39.99, '2023-08-31'),
    ('9780349439273', 'Keeping 13', 1, 1, 38.99, '2023-08-31'),
    ('9780349439280', 'Saving 6', 1, 1, 39.99, '2023-11-30'),
    ('9780349439303', 'Reedeming 6', 1, 1, 38.99, '2023-11-30'),
    ('9780349439358', 'Taming 7', 1, 1, 37.99, '2024-04-16'),
    ('9781234567897', 'The Last Letter', 2, 1, 29.99, '2022-05-01'),
    ('9781234567898', 'The Things We Leave Unfinished', 2, 1, 24.99, '2021-02-01'),
    ('9789180860291', 'Icebreaker', 3, 1, 23.00, '2024-02-28'),
    ('9781398525740', 'Daydream', 3, 1, 22.99, '2024-08-27'),
    ('9789137154732', 'Min historia', 4, 2, 25.00, '2019-06-12');

-- Insert data into the bookstore table
INSERT IGNORE INTO bookstore (id, name, city) VALUES
    (1, 'Bokhandeln City ', 'Stockholm'),
    (2, 'Bookstore New york', 'New york'),
    (3, 'Bookstore London', 'London'),
    ('4', 'Bookstore Paris', 'Paris'),
    ('5', 'Bookstore Berlin', 'Berlin'),
    ('6', 'Bookstore Madrid', 'Madrid');

-- Insert data into the inventory table
INSERT IGNORE INTO inventory (store_id, isbn, amount) VALUES
                                                          (1, '9780349439259', 10),
                                                          (1, '9780349439273', 8),
                                                          (1, '9780349439280', 7),
                                                          (1, '9780349439303', 6),
                                                          (1, '9780349439358', 5),
                                                          (1, '9781234567897', 10),
                                                          (1, '9781234567898', 5),
                                                          (1, '9789180860291', 7),
                                                          (1, '9781398525740', 6),
                                                          (1, '9789137154732', 4),
                                                          (2, '9780349439259', 10),
                                                          (2, '9780349439273', 8),
                                                          (2, '9780349439280', 7),
                                                          (2, '9780349439303', 6),
                                                          (2, '9780349439358', 5),
                                                          (2, '9781234567897', 10),
                                                          (2, '9781234567898', 5),
                                                          (2, '9789180860291', 7),
                                                          (2, '9781398525740', 6),
                                                          (2, '9789137154732', 4),
                                                          (3, '9780349439259', 10),
                                                          (3, '9780349439273', 8),
                                                          (3, '9780349439280', 7),
                                                          (3, '9780349439303', 6),
                                                          (3, '9780349439358', 5),
                                                          (3, '9781234567897', 10),
                                                          (3, '9781234567898', 5),
                                                          (3, '9789180860291', 7),
                                                          (3, '9781398525740', 6),
                                                          (3, '9789137154732', 4),
                                                          (4, '9780349439259', 10),
                                                          (4, '9780349439273', 8),
                                                          (4, '9780349439280', 7),
                                                          (4, '9780349439303', 6),
                                                          (4, '9780349439358', 5),
                                                          (4, '9781234567897', 10),
                                                          (4, '9781234567898', 5),
                                                          (4, '9789180860291', 7),
                                                          (4, '9781398525740', 6),
                                                          (4, '9789137154732', 4),
                                                          (5, '9780349439259', 10),
                                                          (5, '9780349439273', 8),
                                                          (5, '9780349439280', 7),
                                                          (5, '9780349439303', 6),
                                                          (5, '9780349439358', 5),
                                                          (5, '9781234567897', 10),
                                                          (5, '9781234567898', 5),
                                                          (5, '9789180860291', 7),
                                                          (5, '9781398525740', 6),
                                                          (5, '9789137154732', 4),
                                                          (6, '9780349439259', 10),
                                                          (6, '9780349439273', 8),
                                                          (6, '9780349439280', 7),
                                                          (6, '9780349439303', 6),
                                                          (6, '9780349439358', 5),
                                                          (6, '9781234567897', 10),
                                                          (6, '9781234567898', 5),
                                                          (6, '9789180860291', 7),
                                                          (6, '9781398525740', 6),
                                                          (6, '9789137154732', 4);

-- Create the view total_author_book_value
CREATE VIEW total_author_book_value AS
SELECT
    CONCAT(a.first_name, ' ', a.last_name) AS name,
    TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) AS age,
    COUNT(DISTINCT b.isbn) AS book_title_count,
    COALESCE(SUM(b.price * i.amount) * 0.85, 0) AS inventory_value_eur
FROM
    author a
        LEFT JOIN
    book b ON a.id = b.author_id
        LEFT JOIN
    inventory i ON b.isbn = i.isbn
GROUP BY
    a.id;

-- Create the developer user with full access
DROP USER IF EXISTS 'developer'@'localhost';
CREATE USER 'developer'@'localhost' IDENTIFIED BY 'developer_password';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON bookstore.* TO 'developer'@'localhost';

-- Create the webserver user with read-only access
DROP USER IF EXISTS 'webserver'@'localhost';
CREATE USER 'webserver'@'localhost' IDENTIFIED BY 'webserver_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.* TO 'webserver'@'localhost';

-- Apply the changes
FLUSH PRIVILEGES;