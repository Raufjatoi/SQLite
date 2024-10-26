-- q4 : Write a query that displays the given fields (Name,R_Address,Salary) from the
-- Employee relation.

SELECT Name , R_Address , Salary from Employees;

-- q5: Write a query that displays all the records from the Employee relation.

SELECT * from Employees;

-- q6: Execute the following SQL queries &amp; write down their results.

Select * from Employees
Where R_Address='Nawabshah' and R_Address='Larkana';

Select Emp_Id,Salary,R_Address from Employees
Where Salary >=30000;

Select Name,Age,R_Address from Employees
Where age <=27;

Select * from Employees
Where R_Address!='Larkana';

Select Name,Salary,R_Address From Employees
Where Salary <=65000 or R_Address='Lahore'