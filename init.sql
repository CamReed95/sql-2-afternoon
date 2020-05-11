--JOINS
SELECT * FROM invoice invoiceJOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

SELECT i.invoice_date, c.first_name, c.last_name, I.total FROM invoice invoice_id
JOIN customer c ON i.customer_id = c.customer_id;

SELECT c.first_name, c.last_name, e.first_name, e.last_name FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id;

SELECT al.title, ar.name FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

SELECT pt.track_id FROM playlist_track pt
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

SELECT t.name FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

SELECT t.name, a.title
FROM track title
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g,name = 'Alternative & Punk';

-- nested queries
SELECT * FROM invoice 
WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music');

SELECT name FROM track
WHERE tracl_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);

SELECT * FROM track 
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');

SELECT * FROM track 
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (
    SELECT artist_id FROM artist WHERE name = 'Queen'
));

--updating rows
UPDATE customer SET fax = null
WHERE fax IS NOT NULL;

UPDATE customer SET company = 'Self'
WHERE company IS null;

UPDATE customer SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';

UPDATE customer SET support_rep_id = 4
WHERE email = 'Luisrojas@yahoo.cl';

UPDATE track SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal') AND composer IS null;

--group by
SELECT COUNT(*), g.name FROM track t 
JOIN genre g ON t.genre_id = g.genre_id 
GROUP BY g.name;

SELECT COUNT(*), g.name FROM track t 
JOIN genre g ON g.genre_id = t.genre_id 
WHERE g.name = 'Pop' OR g.name = 'Rock' 
GROUP BY g.name;

SELECT ar.name, COUNT(*) FROM album al 
JOIN artist ar ON ar.artist_id = al.artist_id 
GROUP BY ar.name;

--distinct
SELECT DISTINCT composer FROM track;

SELECT DISTINCT billing_postal_code FROM invoice;

SELECT DISTINCT company FROM customer;

--deleteing rows
CREATE TABLE practice_delete (
    name TEXT,
    type TEXT,
    value INTEGER
);

INSERT INTO practice_delete (name, type, value)
VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete (name, type, value)
VALUES ('delete', 'silver', 100);
INSERT INTO practice_delete (name, type, value)
VALUES ('delete', 'gold', 150);

DELETE FROM practice_delete
WHERE type = 'bronze' AND 'silver' AND WHERE value = 150;



--eCommerce Sim 

CREATE TABLE users (
User_id SERIAL PRIMARY KEY,
name TEXT,
email TEXT
)

INSERT INTO users ( name )
VALUES ('Peter'), ('James'), ('John');

CREATE TABLE products ( 
-- Practice joins
-- 1.
SELECT * FROM invoice
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
WHERE unit_price > .99;
-- 2.
SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total FROM invoice
JOIN customer
ON invoice.customer_id = customer.customer_id
-- 3.
SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name FROM customer
JOIN employee
ON customer.support_rep_id = employee.employee_id;
-- 4.
SELECT album.title, artist.name FROM album
JOIN artist
ON album.artist_id = artist.artist_id;
-- 5.
SELECT playlist_track.track_id FROM playlist_track
JOIN playlist
ON playlist_track.playlist_id = playlist.playlist_id
WHERE playlist.name = 'Music';
-- 6.
SELECT track.name FROM playlist_track
JOIN track
ON playlist_track.track_id = track.track_id
WHERE playlist_track.playlist_id = 5;
-- 7.
SELECT track.name, playlist.name FROM track
JOIN playlist_track
ON track.track_id = playlist_track.track_id
JOIN playlist
ON playlist_track.playlist_id = playlist.playlist_id;
-- 8.
SELECT track.name, album.title FROM track
JOIN genre ON track.genre_id = genre.genre_id
JOIN album ON track.album_id = album.album_id
WHERE genre.name = 'Alternative & Punk';


-- Practice nested queries
-- 1. 
SELECT * FROM invoice
WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > .99);
-- 2.
SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music');
-- 3.
SELECT name FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);
-- 4. 
SELECT * FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');
-- 5.
SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');
-- 6.
SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (SELECT artist_id FROM artist WHERE name = 'Queen'));


-- Pratice updating rows
-- 1.
UPDATE customer 
SET fax = null
WHERE fax IS NOT null;
-- 2.
UPDATE customer
SET company = 'Self'
WHERE company IS null;
-- 3.
UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';
-- 4. 
UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';
-- 5. 
UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Metal') AND composer = null;

-- Group by
-- 1. 
SELECT genre.name, COUNT(*) FROM track
JOIN genre ON track.genre_id = genre.genre_id
GROUP BY genre.name
-- 2.
SELECT genre.name, COUNT(*) FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Pop' OR genre.name = 'Rock'
GROUP BY genre.name;
-- 3.
SELECT  artist.name, COUNT (*) FROM artist
JOIN album ON artist.artist_id = album.artist_id
GROUP BY artist.name;

-- Use Distinct
-- 1.
SELECT DISTINCT composer FROM track;
-- 2. 
SELECT DISTINCT billing_postal_code FROM invoice;
-- 3. 
SELECT DISTINCT company FROM customer;

-- Delete Rows
-- 1.
DELETE FROM practice_delete
WHERE type = 'bronze';
-- 2.
DELETE FROM practice_delete
WHERE type = 'silver';
-- 3.
DELETE FROM practice_delete
WHERE value = 150;

-- eCommerce Simulation
-- Create 3 tables following the criteria in the summary.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name TEXT,
    email VARCHAR(60)
);
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    price DECIMAL
);
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id)
);
-- Add some data to fill up each table.
INSERT INTO users(name, email)
VALUES
('Cameron', 'Cam@mail.com'),
('John', 'John@mail.com'),
('Jennifer', 'Jennifer@mail.com');
INSERT INTO products(name, price)
VALUES
('Dog', 9.99),
('Cat', 5.00),
('Turtle', 25.49);
INSERT INTO orders(product_id)
VALUES
(2),
(3),
(1);
-- Run queries against your data.
-- Get all products for the first order.
SELECT products.name FROM orders
JOIN products ON orders.product_id = products.product_id
WHERE orders.order_id = 1;
-- Get all orders.
SELECT * FROM orders;
-- Get the total cost of an order ( sum the price of all products on an order ).
-- COMMENT: I don't understand. The tables were setup such that each order only has one unit of one product. The total price is simply the price of whatever product is in the order.
-- Add a foreign key reference from orders to users.
ALTER TABLE orders
ADD COLUMN user_id INT REFERENCES users(user_id);
-- Update the orders table to link a user to each order.
UPDATE orders
SET user_id = 1 WHERE order_id = 1;
UPDATE orders
SET user_id = 3 WHERE order_id = 2;
UPDATE orders
SET user_id = 2 WHERE order_id = 3;
-- Run queries against your data.
-- Get all orders for a user.
SELECT * FROM orders
JOIN users ON orders.user_id = users.user_id
WHERE users.user_id = 2;
-- Get how many orders each user has.
SELECT orders.user_id, COUNT(*) FROM orders
JOIN users ON orders.user_id = users.user_id
GROUP BY orders.user_id;