-- Qno2
CREATE TABLE "student" (
    "id" INTEGER PRIMARY KEY,
    "roll_no" VARCHAR(10) NOT NULL UNIQUE,
    "name" VARCHAR(20) NOT NULL,
    "address" VARCHAR(50),
    "age" INTEGER,
    "department" VARCHAR(30)
);

-- Qno3
INSERT INTO "student" ("roll_no", "name", "address", "age", "department")
VALUES 
('11IT01', 'Kamran', 'Nawabshah', 23, 'IT'),
('11IT02', 'Bilal', 'Hyderabad', 22, 'IT'),
('11EE01', 'Irfan', 'Karachi', 23, 'EE'),
('11CE01', 'Hina', 'Hyderabad', 22, 'CE');

-- Qno4
ALTER TABLE "student" ADD COLUMN "F_Name" VARCHAR(50);

-- Qno5: Changing the datatype of roll_no from CHAR(10) to VARCHAR(10).
-- ALTER TABLE "student" ALTER COLUMN "roll_no" TYPE VARCHAR(10); -- dont work on sqlite3

-- Qno6
ALTER TABLE "student" DROP COLUMN "F_Name";

-- Qno7: What will be the result of the following queries?

-- a) 
-- UPDATE "student"
-- SET "address" = 'Larkana'
-- WHERE "roll_no" = '11IT02';
-- ANS: This will update the address of the student with roll_no = '11IT02' to 'Larkana'.

-- b) 
-- DELETE FROM "student"
-- WHERE "roll_no" = '11EE01';
-- ANS: This will delete the record of the student with roll_no '11EE01' from the table.

-- c) 
-- UPDATE "student"
-- SET "address" = 'Nawabshah', "department" = 'ME';
-- ANS: This will update the address and department of all students to 'Nawabshah' and 'ME' respectively, as there is no WHERE clause to filter specific rows.

-- d) 
-- DROP TABLE "student";
-- ANS: This will permanently delete the "student" table and all its data from the database.

-- e) 
-- DROP DATABASE "uni";
-- ANS: This command is invalid in SQLite because it does not support dropping an entire database with SQL commands. Database deletion must be done manually by removing the `.db` file.