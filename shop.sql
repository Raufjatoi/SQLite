CREATE TABLE "customer" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL, 
    "phone" INTEGER NOT NULL,
    "address" TEXT
);

CREATE TABLE "product"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL, 
    "price" INTEGER NOT NULL,
    "quantity" INTEGER DEFAULT 0,
    "expire" TEXT,
    "vendor" TEXT NOT NULL,
    "brand" TEXT
);

CREATE TABLE "invoice"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "product_id" INTEGER,
    "customer_id" INTEGER,
    "date" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "discount" INTEGER DEFAULT 0,
    "tax" INTEGER DEFAULT 0,
    "total" INTEGER ,
    FOREIGN KEY("product_id") REFERENCES "product"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customer"("id")
);

INSERT INTO "customer" ("name", "phone", "address") VALUES
('Abdul Rauf', 3192479656, 'Ghulam Hyder Shah Colony'),
('Gul Muhammad', 3493109622, 'Farsi Bhag'),
('Muhammad Umar', 3277007580, 'Lal Muhammad Keerio'),
('Muhammad Ahsan', 3140350511, 'Ghulam Hyder Shah Colony');

INSERT INTO "product" ("name", "price", "quantity", "expire", "vendor", "brand") VALUES
('Iphone 16', 5000000, 5, NULL, 'Karachi exports', 'Apple'),
('Rice', 300, 10, '2026-10-28', 'Nawabshah Rice', 'Kainat'),
('Watch', 5000, 2, NULL, 'Hyderabad Watch center', 'Rado'),
('Laptop', 100000, 1, NULL, 'Nawabshah Mobile Shop', 'Lenovo');


INSERT INTO "invoice" ("product_id", "customer_id", "date", "quantity", "discount", "tax" , "total") 
VALUES
(1, 3, '2024-10-28', 2, 20, 2 , NULL),
(2, 1, '2024-12-28', 2, 15, 1 , NULL);

--(1, 3, '2024-10-28', 2, 20, 2, (5000000 * 2 - 20 + 2)),
--(2 , 1, '2024-12-28', 2, 15, 1, (300 * 2 - 15 + 1));

CREATE TRIGGER calculate_total
AFTER INSERT ON invoice
BEGIN
    UPDATE invoice
    SET total = (
        (SELECT price FROM product WHERE product.id = NEW.product_id) * NEW.quantity
        - NEW.discount
        + NEW.tax
    )
    WHERE id = NEW.id;
END;

CREATE VIEW invoice_view AS
SELECT 
    invoice.id,
    invoice.product_id,
    invoice.customer_id,
    invoice.date,
    invoice.quantity,
    invoice.discount,
    invoice.tax,
    ((product.price * invoice.quantity) - invoice.discount + invoice.tax) AS total
FROM 
    invoice
JOIN 
    product ON product.id = invoice.product_id;