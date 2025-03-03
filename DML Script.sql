INSERT INTO Employees (Full_Name, Job_Title, Department_ID, Gender, Hire_Date, Annual_Salary, Manager_ID) VALUES ('John Doe', 'Software Engineer', 2, 'Male', '2023-06-15', 75000.00, 5);


INSERT INTO Departments (Department_Name) VALUES ('Human Resources');


UPDATE Payroll
SET Salary_Amount = 80000.00
WHERE Employee_ID = 1;



UPDATE Leave_Requests
SET Leave_Status = 'Approved'
WHERE Leave_ID = 1;


DELETE FROM Employees
WHERE Employee_ID = 10;



SELECT Full_Name, Job_Title, Department_ID
FROM Employees
WHERE Department_ID = 2;




SELECT e.Full_Name, p.Salary_Amount, p.Bonus_Amount
FROM Employees e
JOIN Payroll p ON e.Employee_ID = p.Employee_ID;


SELECT e.Full_Name, a.Date, a.Check_In_Time, a.Check_Out_Time
FROM Employees e
JOIN Attendance a ON e.Employee_ID = a.Employee_ID;



SELECT AVG(Salary_Amount) AS Average_Salary FROM Payroll;


SELECT Department_ID, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Department_ID;



SELECT e.Full_Name, d.Department_Name, p.Salary_Amount
FROM Employees e
JOIN Payroll p ON e.Employee_ID = p.Employee_ID
JOIN Departments d ON e.Department_ID = d.Department_ID;




FROM Employees e
JOIN Attendance a ON e.Employee_ID = a.Employee_ID
WHERE a.Total_Hours_Worked > 8;

