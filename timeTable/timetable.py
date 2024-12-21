import sqlite3
import pandas as pd

conn = sqlite3.connect("timeTable.db")
cursor = conn.cursor()

cursor.executemany("""
    INSERT INTO Departments (name)
    VALUES (?);
""", [
    ('Computer Science',),
    ('Artificial Intelligence',),
    ('Cyber Security',)
])

cursor.executemany("""
    INSERT INTO Teachers (name, speciality, free_hours, dept_id)
    VALUES (?, ?, ?, ?);
""", [
    ('M:Owais', 'Programming', 4, 1),
    ('Miss Arain', 'Calculus', 3, 2),
    ('Ajeeb', 'Linear Algebra', 2, 3)
])

cursor.executemany("""
    INSERT INTO Subjects (name, dept_id)
    VALUES (?, ?);
""", [
    ('Python Programming', 1),
    ('Math', 2),
    ('Networking', 3)
])

cursor.executemany("""
    INSERT INTO Breaks (dept_id, start_time, end_time)
    VALUES (?, ?, ?);
""", [
    (1, '10:30', '11:00'),
    (2, '10:30', '11:00'),
    (3, '10:30', '11:00')
])

cursor.executemany("""
    INSERT INTO Timetable (teacher_id, subject_id, dept_id, day, start_time, end_time)
    VALUES (?, ?, ?, ?, ?, ?);
""", [
    (1, 1, 1, 'Monday', '09:00', '10:00'),
    (2, 2, 2, 'Monday', '10:00', '11:00'),
    (3, 3, 3, 'Monday', '11:00', '12:00')
])

conn.commit()

def display_table(table_name):
    df = pd.read_sql_query(f"SELECT * FROM {table_name};", conn)
    print(f"Table: {table_name}")
    print(df)
    print("\n")

table_names = ["Departments", "Teachers", "Subjects", "Breaks", "Timetable"]
for table in table_names:
    display_table(table)

conn.close()