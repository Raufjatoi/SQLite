import sqlite3

conn = sqlite3.connect('simple.db')
c = conn.cursor()

def create_table():
    c.execute("CREATE TABLE IF NOT EXISTS someData(name TEXT , datastamp TEXT , 'from' TEXT )")

def data_entry():
    c.execute("INSERT INTO someData VALUES ('Muhammad Umar' , '20-Oct-2024' , 'Nawabshah')")
    conn.commit()
    c.close()
    conn.close()

#create_table()
data_entry()

