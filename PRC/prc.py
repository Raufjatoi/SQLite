import sqlite3
import time
import datetime
import random
import matplotlib.pyplot as m
import matplotlib.dates as mdates
from matplotlib import style

style.use('fivethirtyeight')

conn = sqlite3.connect('prc.db')
c = conn.cursor()

def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS stuffToPlot(name TEXT, age INT, datestamp TEXT, keyword TEXT, value REAL)')

def data_entry():
    datestamp = str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    c.execute('INSERT INTO stuffToPlot VALUES("Abdul Rauf", 20, ?, "python", 10)', (datestamp,))
    conn.commit()


def dynamic_data_entry():
    name = random.choice(["Ahsan", "Adil", "Mudassir", "Rehman", "Umar"])
    age = random.randint(18, 50)
    datestamp = str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    keyword = random.choice(["python", "ai", "ml", "dl", "data"])
    value = random.uniform(1.0, 100.0)

    c.execute('INSERT INTO stuffToPlot (name, age, datestamp, keyword, value) VALUES (?, ?, ?, ?, ?)', 
              (name, age, datestamp, keyword, value))
    conn.commit()

def read_data():
    c.execute('SELECT * FROM stuffToPlot')
    rows = c.fetchall()
    for row in rows:
        print(row)

def graph_data():
    c.execute('SELECT datestamp, value FROM stuffToPlot')
    data = c.fetchall()

    dates = []
    values = []

    for row in data:
        dates.append(datetime.datetime.strptime(row[0], '%Y-%m-%d %H:%M:%S'))
        values.append(row[1])

    m.plot_date(dates, values, '-', label='Value over Time')
    m.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m-%d %H:%M:%S'))
    m.gcf().autofmt_xdate()
    m.title('Dynamic Data Visualization')
    m.xlabel('Timestamp')
    m.ylabel('Value')
    m.legend()
    m.show()

create_table()
data_entry()


for i in range(10):
    dynamic_data_entry()
    time.sleep(1)


#read_data()

graph_data()

c.close()
conn.close()