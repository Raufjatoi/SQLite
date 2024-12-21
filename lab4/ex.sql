-- CREATE DATABASE Business;

-- USE Business;

CREATE TABLE Customers (
    Cust_Id INT PRIMARY KEY,
    Cust_Name VARCHAR(10)
);

CREATE TABLE Sales (
    Cust_Id INT,
    Item VARCHAR(10),
    FOREIGN KEY (Cust_Id) REFERENCES Customers(Cust_Id)
);

INSERT INTO Customers (Cust_Id, Cust_Name) VALUES
(101, 'Ahmed'),
(102, 'Kamran'),
(103, 'Faizan');

INSERT INTO Sales (Cust_Id, Item) VALUES
(102, 'Computer'),
(103, 'Monitor'),
(103, 'Printer'),
(104, 'Camera');

SELECT *
FROM Customers, Sales;

SELECT *
FROM Customers
JOIN Sales ON Customers.Cust_Id = Sales.Cust_Id;

CREATE TABLE Sales1 (
    Cust_Id INT,
    Cust_Name VARCHAR(10)
);

INSERT INTO Sales1 (Cust_Id, Cust_Name) VALUES
(101, 'Keyboard'),
(102, 'Computer'),
(103, 'Monitor'),
(104, 'Camera'),
(105, 'Mouse');

SELECT Sales1.Cust_Id, Sales1.Cust_Name
FROM Sales1
INTERSECT
SELECT Sales.Cust_Id, Sales.Item
FROM Sales;

SELECT *
FROM Sales1
WHERE Cust_Id NOT IN (SELECT Cust_Id FROM Sales);