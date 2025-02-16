-- Enable advanced options for bulk insert (Run this only if necessary)
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

-- Load Departments Table
BULK INSERT Departments
FROM 'C:\Users\TECHNIFI\Desktop\Data\departments.csv'

WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);

-- Load Employees Table
BULK INSERT Employees
FROM 'C:\Users\TECHNIFI\Desktop\Data\employees.csv'

WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
Select * from Employees;


-- Load Salaries Table
BULK INSERT Salaries
FROM 'C:\Users\TECHNIFI\Desktop\Data\salaries.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
Select * from Salaries;

-- Load Attendance Table
BULK INSERT Attendance
FROM 'C:\Users\TECHNIFI\Desktop\Data\attendance.csv'

WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
Select * from Attendance;
-- Load Leave Requests Table
BULK INSERT Leave_Requests
FROM 'C:\Users\TECHNIFI\Desktop\Data\leave_requests.csv'

WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
Select * from  Leave_Requests;
-- Load Performance Table
BULK INSERT Performance
FROM 'C:\Users\TECHNIFI\Desktop\Data\performance.csv'

WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
Select * from  Performance;
-- Load Payroll Table
BULK INSERT Payroll
FROM 'C:\Users\TECHNIFI\Desktop\Data\payroll.csv'

WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
Select * from  Payroll;
-- Load Resignations Table
BULK INSERT Resignations
FROM 'C:\Users\TECHNIFI\Desktop\Data\resignations.csv'

WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);

-- Disable xp_cmdshell (Optional - for security)
EXEC sp_configure 'xp_cmdshell', 0;
RECONFIGURE;
