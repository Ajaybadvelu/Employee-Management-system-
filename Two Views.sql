CREATE VIEW Employee_Payroll_Summary AS
SELECT 
    e.Employee_ID, 
    e.Full_Name, 
    e.Job_Title, 
    d.Department_Name, 
    p.Salary_Amount, 
    p.Bonus_Amount, 
    p.Payment_Status
FROM Employees e
JOIN Payroll p ON e.Employee_ID = p.Employee_ID
JOIN Departments d ON e.Department_ID = d.Department_ID;




CREATE VIEW Leave_Request_Details AS
SELECT 
    e.Employee_ID, 
    e.Full_Name, 
    l.Leave_Type, 
    l.Start_Date, 
    l.End_Date, 
    l.Leave_Status, 
    m.Full_Name AS Manager_Name
FROM Employees e
JOIN Leave_Requests l ON e.Employee_ID = l.Employee_ID
JOIN Employees m ON e.Manager_ID = m.Employee_ID;
