--  users table
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    password TEXT NOT NULL UNIQUE,
    balance REAL DEFAULT 0
);

-- inserting some data
INSERT INTO users (name, age, balance, password ) VALUES ('Abdul Rauf', 20, 1000.00, 'password1');
INSERT INTO users (name, age, balance, password) VALUES ('Muhammad Ahsan', 19, 5000.00, 'password2');
INSERT INTO users (name, age, balance, password) VALUES ('Muhammad Umar', 19, 75000.00, 'password3');
INSERT INTO users (name, age, balance, password) VALUES ('Mudassir', 19, 3000.00, 'password4');
INSERT INTO users (name, age, balance, password) VALUES ('Mujtaba', 19, 1500.00, 'password5');
INSERT INTO users (name, age, balance, password) VALUES ('Owais', 19, 2500.00, 'password6');
INSERT INTO users (name, age, balance, password) VALUES ('Huzaifa', 20, 4000.00, 'password7');
INSERT INTO users (name, age, balance, password) VALUES ('Muhammad Ali', 20, 6000.00, 'password8');
INSERT INTO users (name, age, balance, password) VALUES ('Kashif', 20, 3500.00, 'password9');
INSERT INTO users (name, age, balance, password) VALUES ('Rashid', 20, 4500.00, 'password10');
INSERT INTO users (name, age, balance, password) VALUES ('Ali', 20, 2000.00, 'password11');