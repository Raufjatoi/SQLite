-- passengers tablke 
CREATE TABLE Passengers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    origin TEXT NOT NULL,
    destination TEXT NOT NULL
);

-- airports table 
CREATE TABLE Airports (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    country TEXT NOT NULL,
    city TEXT NOT NULL,
);

-- flights table
CREATE TABLE Flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    from TEXT NOT NULL,
    to TEXT NOT NULL,
    name TEXT NOT NULL,
    passenger_id TEXT NOT NULL,
    airport_id TEXT NOT NULL
);

-- inserting some data 
INSERT INTO Passengers(name , age , origin , destination) VALUES('Abdul Rauf', 20 , 'Karachi' , 'Nawabshah');
INSERT INTO Airports(name , country , city ) VALUES ('Karachi Airport','Pakistan', 'Karachi');
INSERT INTO Airports(name , country , city) VALUES('Nawabshah Airport', 'Pakistan', 'Nawabshah');
INSERT INTO Flights(from , to , name , passenger_ID, airport_id) VALUES('karachi', 'nawabshah', 1 , 1 );



