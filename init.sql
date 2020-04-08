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
Product_id SERIAL PRIMARY KEY,
Name TEXT, 
Price DECIMAL
)

INSERT INTO products (name, price)
VALUES ('car', 1.00), ('house', 2.00), ('plane', 3.00)

CREATE TABLE orders(
Orders_id SERIAL PRIMARY KEY,
	User_id INT REFERENCES users(user_id),
	products _id INT REFERENCES products(product_id)
);

SELECT * products FROM oder_id = 1;
SELECT * orders;
SELECT SUM(product_id = *)

INSERT INTO orders (user_id, product_id)
VALUES 
(1, 2)

SELECT p.name, p.price FROM orders c
JOIN products p ON c.product_id = p.product_id
WHERE c.user_id = 3;

    