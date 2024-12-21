import sqlite3
import datetime
import random
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from matplotlib import style

style.use('fivethirtyeight')

conn = sqlite3.connect('complex_data.db')
c = conn.cursor()

def create_complex_table():
    c.execute('''
        CREATE TABLE IF NOT EXISTS EmployeeData(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            role TEXT,
            experience INT,
            salary REAL,
            performance REAL,
            datestamp TEXT
        )
    ''')

def generate_complex_data():
    roles = ["Data Scientist", "Developer", "Manager", "Analyst", "Engineer"]
    names = ["Rauf", "Ahsan", "Adil", "Mudassir", "furqan" , "Umar" , "Ali" , "Muhammad" , "Rehan"]
    
    for _ in range(100):
        name = random.choice(names)
        role = random.choice(roles)
        experience = random.randint(1, 20)
        salary = round(random.uniform(30000, 120000) + experience * 2500, 2) 
        performance = round(random.uniform(50, 100) - (20 - experience) * 0.5, 2)
        datestamp = (datetime.datetime.now() - datetime.timedelta(days=random.randint(0, 365))).strftime("%Y-%m-%d")
        
        c.execute('''
            INSERT INTO EmployeeData(name, role, experience, salary, performance, datestamp) 
            VALUES (?, ?, ?, ?, ?, ?)
        ''', (name, role, experience, salary, performance, datestamp))
    conn.commit()

def visualize_data():
    query = "SELECT * FROM EmployeeData"
    df = pd.read_sql_query(query, conn)

    df['datestamp'] = pd.to_datetime(df['datestamp'])

    print(df.head())

    sns.lmplot(x='experience', y='salary', data=df, height=6, aspect=1.5, hue='role', markers='o')
    plt.title('Experience vs. Salary with Role Distinction')
    plt.xlabel('Experience (Years)')
    plt.ylabel('Salary ($)')
    plt.show()

    corr = df[['experience', 'salary', 'performance']].corr()
    plt.figure(figsize=(8, 6))
    sns.heatmap(corr, annot=True, cmap='coolwarm', fmt=".2f", linewidths=0.5)
    plt.title('Correlation Matrix')
    plt.show()

    plt.figure(figsize=(10, 6))
    for role in df['role'].unique():
        role_data = df[df['role'] == role].groupby('datestamp').mean()
        plt.plot(role_data.index, role_data['salary'], label=role)

    plt.title('Salary Trends Over Time by Role')
    plt.xlabel('Date')
    plt.ylabel('Average Salary ($)')
    plt.legend()
    plt.grid(True)
    plt.show()

    sns.pairplot(df, vars=['experience', 'salary', 'performance'], hue='role', height=2.5)
    plt.suptitle('Pairwise Relationships Between Key Metrics', y=1.02)
    plt.show()

if __name__ == "__main__":
    #create_complex_table()
    #generate_complex_data()
    visualize_data()

c.close()
conn.close()