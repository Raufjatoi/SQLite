CREATE TABLE "St_info"(
    "st_no" NCHAR,
    "adm_date" DATE,
    "st_name" TEXT, 
    "st_age" INT,
    "st_address" TEXT
);

CREATE TABLE "Course"(
    "c_no" NCHAR, 
    "c_name" TEXT,
    "c_teacher" TEXT, 
    "c_credit_hours" INT
);

INSERT INTO "St_info" ("st_no", "adm_date", "st_name", "st_age", "st_address") 
VALUES 
('1', '2024-10-21', 'Abdul Rauf', 21, 'nwb '),
('2', '2024-10-22', 'Muhammad Ahsan', 22, 'nwb'),
('3', '2024-10-23', 'Muhammad Umar', 23, 'nwb'),
('4', '2024-10-24', 'Abdul Rehman', 24, 'shapur'),
('5', '2024-10-25', 'Amjad Ali', 25, 'nwb');

INSERT INTO "Course" ("c_no", "c_name", "c_teacher", "c_credit_hours")
VALUES 
('1', 'DB', 'Sir Awais', 3),
('2', 'AI', 'Sir Akhtar', 4),
('3', 'ML', 'Sir Saifullah', 4),
('4', 'DS', 'Sir Farhan', 3),
('5', 'Cyber Security', 'Sir Ahmed', 3);