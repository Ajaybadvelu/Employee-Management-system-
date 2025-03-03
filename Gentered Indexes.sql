-- Index to optimize searching for employees by name
CREATE INDEX idx_employee_name ON Employees (Full_Name);

-- Index to speed up salary-based queries
CREATE INDEX idx_payroll_salary ON Payroll (Salary_Amount);

-- Index to improve search efficiency for attendance by date
CREATE INDEX idx_attendance_date ON Attendance (Attendance_Date);


