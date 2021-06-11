DROP DATABASE IF EXISTS todo_db;

CREATE DATABASE todo_db;

USE todo_db;
CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE items (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    text VARCHAR(50) NOT NULL,
    isDone BOOL NOT NULL,
    uid INT NOT NULL,
    FOREIGN KEY (uid) REFERENCES users(id)
);

USE todo_db;
INSERT INTO users (name, email, password)
VALUES ('Jack Doe', 'jackdoe@gmail.com', 'password1234'),
('Jane Doe', 'janedoe@gmail.com', 'password4321');

USE todo_db;

INSERT INTO items (text, isDone, uid)
VALUES ('take out trash', false, 1),
('do laundry', false, 1),
('cook dinner', true, 2),
('walk the dog', false, 2),
('pick up dry cleaning', true, 1);

USE todo_db;
SELECT users.email, users.name, items.text, items.isDone
FROM users
INNER JOIN items
ON users.id = items.uid;

USE todo_db;
SELECT users.email, users.name, items.text, items.isDone
FROM users
LEFT JOIN items
ON users.id = items.uid;

USE todo_db;
SELECT users.email, users.name, items.text, items.isDone
FROM items
RIGHT JOIN users
ON users.id = items.uid;

