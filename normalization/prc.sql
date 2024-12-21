-- Unnormalized Form
CREATE TABLE "passengers"(
    "id" INTEGER,
    "name" TEXT,
    "age" TEXT,
    "from" TEXT,
    "destination" TEXT
);

INSERT INTO "passengers"
VALUES
(1, 'Abdul Rauf, Muhammad Adil', '20, 19', 'karachi, nawabshah', 'nawabahah, karachi'),
(2, 'Muhammad Ahsan, Muhammad Umar', '19, 19', 'Lahore, nawabshah', 'Karachi, dadu');

-- 1st Normalized Form
CREATE TABLE "passengers_1NF"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "age" INT,
    "from" TEXT,
    "destination" TEXT
);

INSERT INTO "passengers_1NF" ("name", "age", "from", "destination")
VALUES 
('Abdul Rauf', 20, 'karachi', 'nawabahah'),
('Muhammad Ahsan', 19, 'nawabshah', 'Karachi'),
('Muhammad Umar', 20, 'Lahore', 'dadu');

-- 2nd Normalized Form
CREATE TABLE "passengers_2NF"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "age" INT
);

CREATE TABLE "travel_2NF" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "passenger_id" INTEGER,
    "from" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    FOREIGN KEY("passenger_id") REFERENCES "passengers_2NF"("id")
);

-- Insert into passengers_2NF
INSERT INTO "passengers_2NF"("name", "age")
VALUES
('Abdul Rauf', 20),
('Muhammad Ahsan', 19),
('Muhammad Umar', 20);

-- Insert into travel_2NF
INSERT INTO "travel_2NF"("passenger_id", "from", "destination")
VALUES 
(1, 'karachi', 'nawabshah'),
(1, 'nawabshah', 'karachi'),
(2, 'Lahore', 'dadu');
