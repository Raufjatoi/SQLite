CREATE TABLE IF NOT EXISTS Employees (
    Emp_Id INTEGER PRIMARY KEY ,
    Name CHAR(20) NOT NULL,
    Age INT NOT NULL,
    R_Address VARCHAR(25),
    Salary FLOAT NOT NULL
);

INSERT INTO Employees (Name, Age, R_Address, Salary) VALUES 
('Danish', 28, 'Nawabshah', 20000),
('Khuram', 32, 'Hyderabad', 15000),
('Ahmed', 25, 'Karachi', 20000),
('Adnan', 23, 'Sukkur', 65000),
('Bilal', 27, 'Larkana', 30000),
('Imran', 22, 'Larkana', 40000),
('Ayaz', 24, 'Karachi', 50000);
