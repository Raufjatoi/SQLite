-- unnormalized table
CREATE TABLE "orders" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "CustomerName" TEXT,
    "Products" TEXT,
    "Quantities" TEXT,
    "PricesPerUnit" TEXT,
    "TotalPrice" REAL
);

-- unnormalized data
INSERT INTO "orders" ("CustomerName", "Products", "Quantities", "PricesPerUnit", "TotalPrice")
VALUES 
('Abdul Rauf', 'Laptop', '1', '1000', 1000),
('Muhammad Ahsan', 'Phone', '2', '500', 1000),
('Muhammad Umar', 'Mouse, Keyboard', '1, 1', '20, 30', 50);

-- 1NF table
CREATE TABLE "orders_1NF" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "CustomerName" TEXT,
    "Product" TEXT,
    "Quantity" INTEGER,
    "PricePerUnit" REAL,
    "TotalPrice" REAL
);

-- normalized data
INSERT INTO "orders_1NF" ("CustomerName", "Product", "Quantity", "PricePerUnit", "TotalPrice")
VALUES
('Abdul Rauf', 'Laptop', 1, 1000, 1000),
('Muhammad Ahsan', 'Phone', 2, 500, 1000),
('Muhammad Umar', 'Mouse', 1, 20, 20),
('Muhammad Umar', 'Keyboard', 1, 30, 30);

-- Orders table,  2 normalization form 
CREATE TABLE "orders_2NF" (
    "OrderID" INTEGER PRIMARY KEY,
    "CustomerName" TEXT
);

-- Products table , 2nd normalization form 
CREATE TABLE "products_2NF" (
    "ProductID" INTEGER PRIMARY KEY AUTOINCREMENT,
    "OrderID" INTEGER,
    "Product" TEXT,
    "Quantity" INTEGER,
    "PricePerUnit" REAL,
    "TotalPrice" REAL,
    FOREIGN KEY ("OrderID") REFERENCES "orders_2NF"("OrderID")
);

INSERT INTO "orders_2NF" ("OrderID", "CustomerName")
VALUES 
(1, 'Abdul Rauf'),
(2, 'Muhammad Ahsan'),
(3, 'Muhammad Umar');

INSERT INTO "products_2NF" ("OrderID", "Product", "Quantity", "PricePerUnit", "TotalPrice")
VALUES
(1, 'Laptop', 1, 1000, 1000),
(2, 'Phone', 2, 500, 1000),
(3, 'Mouse', 1, 20, 20),
(3, 'Keyboard', 1, 30, 30);