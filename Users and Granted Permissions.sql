CREATE LOGIN hr_manager WITH PASSWORD = 'HRsecurePass123';
CREATE USER hr_manager FOR LOGIN hr_manager;

CREATE LOGIN dept_manager WITH PASSWORD = 'DeptPass123';
CREATE USER dept_manager FOR LOGIN dept_manager;

CREATE LOGIN payroll_staff WITH PASSWORD = 'PayrollPass123';
CREATE USER payroll_staff FOR LOGIN payroll_staff;

CREATE LOGIN employee_user WITH PASSWORD = 'EmployeePass123';
CREATE USER employee_user FOR LOGIN employee_user;


1️ HR Manager (hr_manager) – Full Control on Employees, Payroll, Leave Requests
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO hr_manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payroll TO hr_manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Leave_Requests TO hr_manager;



GRANT SELECT, UPDATE ON Employees TO dept_manager;



GRANT SELECT, UPDATE ON Payroll TO payroll_staff;Payroll staff can only manage salaries.


GRANT SELECT ON Payroll TO employee_user;
GRANT SELECT ON Leave_Requests TO employee_user;





SELECT dp.name AS UserName, dp.type_desc, 
       o.name AS ObjectName, p.permission_name
FROM sys.database_principals AS dp
JOIN sys.database_permissions AS p ON dp.principal_id = p.grantee_principal_id
JOIN sys.objects AS o ON p.major_id = o.object_id
WHERE dp.name IN ('hr_manager', 'dept_manager', 'payroll_staff', 'employee_user');
