-- Departments Table
CREATE TABLE Departments (
    Department_ID INT IDENTITY(1,1) PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL
);

-- Employees Table
CREATE TABLE Employees (
    Employee_ID INT IDENTITY(1,1) PRIMARY KEY,
    Full_Name VARCHAR(255) NOT NULL,
    Job_Title VARCHAR(100) NOT NULL,
    Department_ID INT,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    Hire_Date DATE NOT NULL,
    Annual_Salary DECIMAL(10,2) NOT NULL,
    Manager_ID INT NULL,
    CONSTRAINT FK_Department FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
    CONSTRAINT FK_Manager FOREIGN KEY (Manager_ID) REFERENCES Employees(Employee_ID) ON DELETE SET NULL
);

-- Salaries Table (Optional if Payroll stores the latest salary)
CREATE TABLE Salaries (
    Salary_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,
    Monthly_Salary DECIMAL(10,2) NOT NULL,
    Tax_Deductions DECIMAL(10,2),
    Pay_Date DATE,
    CONSTRAINT FK_Employee_Salary FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE
);

-- Attendance Table (Fixed comma issue)
CREATE TABLE Attendance (
    Attendance_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,                     
    Attendance_Date DATE NOT NULL,                
    Check_In_Time TIME,                           
    Check_Out_Time TIME,                          
    Total_Hours_Worked DECIMAL(5,2),              
    Status VARCHAR(20) CHECK (Status IN ('Present', 'Absent', 'On Leave', 'Remote')),  
    CONSTRAINT FK_Employee_Attendance FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE
);

-- Leave Requests Table
CREATE TABLE Leave_Requests (
    Leave_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,
    Leave_Type VARCHAR(50) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Leave_Status VARCHAR(20) CHECK (Leave_Status IN ('Pending', 'Approved', 'Rejected')),
    CONSTRAINT FK_Employee_Leave FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE
);

-- Performance Table (Normalized Training Completed)
CREATE TABLE Performance (
    Performance_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,
    Performance_Score INT CHECK (Performance_Score BETWEEN 1 AND 100),
    Last_Promotion_Date DATE,
    CONSTRAINT FK_Employee_Performance FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE
);

-- Payroll Table
CREATE TABLE Payroll (
    Payroll_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,
    Salary_Amount DECIMAL(10,2) NOT NULL,
    Bonus_Amount DECIMAL(10,2),
    Deductions DECIMAL(10,2),
    Payment_Status VARCHAR(20) CHECK (Payment_Status IN ('Processed', 'Pending', 'Failed')),
    CONSTRAINT FK_Employee_Payroll FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE
);

-- Resignations Table
CREATE TABLE Resignations (
    Exit_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,
    Resignation_Date DATE NOT NULL,
    Reason_for_Leaving VARCHAR(255),
    CONSTRAINT FK_Employee_Resignation FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE
);
