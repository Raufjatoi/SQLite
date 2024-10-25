--DROP TABLE IF EXISTS "Students";
--DROP TABLE IF EXISTS "Teacher";

CREATE TABLE IF NOT EXISTS "Students"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "roll_no" INTEGER NOT NULL,
    "department" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "Teacher"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "subject" TEXT NOT NULL
);

INSERT INTO "Students" ("name", "roll_no", "department") 
VALUES 
('Abdul Rauf', 32, 'AI'),
('Muhammad Ahsan', 45, 'AI'),
('Muhammmad Umar', 66, 'AI'),
('Abdul Rehman', 65, 'AI'),
('amjad', 1, 'Cyber');

INSERT INTO "Teacher" ("name", "subject")
VALUES 
('Muhammad Awais', 'Data bases Lab'),
('Saifullah memon', 'Data structures'),
('Akhtar Jalbani', 'AI');