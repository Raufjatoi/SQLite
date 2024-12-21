CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "age" INT NOT NULL
);

CREATE TABLE "product" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "price" INT NOT NULL
);

CREATE TABLE "buys" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "product_id" INTEGER,
    "customer_id" INTEGER,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY ("product_id") REFERENCES "product"("id")
);

INSERT INTO "product" ("name", "price") 
VALUES 
('Laptop', 1000),
('Phone', 500),
('Tablet', 300),
('Airpod', 250);

INSERT INTO "customers" ("name", "age") 
VALUES 
('Abdul Rauf', 20),
('Muhammad Adil', 19),
('Najaf', 19),
('Mudassir', 20),
('Muhammad Ali', 19),
('Muhammad Umar', 18),
('Muhammad Owais', 27),
('Huzaifa', 18),
('Rehman', 19),
('Ali', 20);

INSERT INTO "buys" ("product_id", "customer_id") 
VALUES 
(1, 1), -- me to Laptop
(2, 2), -- Muhammad Adil to Phone
(3, 3), -- Najaf to Tablet
(4, 4); -- Mudassir to Airpod


CREATE VIEW "new_buys" AS
SELECT 
    b.id AS "Buy_ID",
    c.name AS "Customer_Name",
    p.name AS "Product_Name"
FROM 
    buys b
JOIN 
    customers c ON b.customer_id = c.id
JOIN 
    product p ON b.product_id = p.id;

SELECT 
    "customers.name", 
    "customers.age", 
    "product.name" 
FROM 
    customers
JOIN 
    product
ON 
    customers.id = product.id;
