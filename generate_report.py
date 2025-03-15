import pyodbc  # Import the pyodbc library for connecting to SQL Server

# Database connection details (Replace with your actual database credentials)
server = 'DESKTOP-J889R5B\SQLEXPRESS'  # Example: 'DESKTOP-XYZ\SQLEXPRESS'
database = 'milestone2'  # Example: 'milestone'

# Establishing connection to SQL Server
try:
    conn = pyodbc.connect(
        f'DRIVER={{SQL Server}};'
        f'SERVER={server};'
        f'DATABASE={database};'
        'Trusted_Connection=yes'
    )
    print("✅ Successfully connected to the database!\n")  # Connection success message
except Exception as e:
    print("❌ Connection failed:", e)  # Print error message if connection fails
    exit()

# Create a cursor object to execute queries
cursor = conn.cursor()

# SQL query to retrieve a subset of data (Modify table and columns as needed)
# query = """
# SELECT TOP 10 Employee_ID, Employee_Name, Salary_Amount
# FROM Payroll  -- Replace 'Payroll' with your actual table name
# ORDER BY Salary_Amount DESC;
# """
query = """
Select * FROm Salaries;
"""

# Execute the query
try:
    cursor.execute(query)
    results = cursor.fetchall()  # Fetch all results from the query
    print("✅ Query executed successfully!\n")  # Success message
except Exception as e:
    print("❌ Query execution failed:", e)  # Print error message if query fails
    conn.close()  # Close the connection
    exit()

# Display results
for row in results:
    print(row)  # This prints each row from the employee table

# # Display the results on the screen
# print("📊 Employee Salary Report:")
# print("-" * 50)


# for row in results:
#     print(f"ID: {row.Employee_ID}, Name: {row.Employee_Name}, Salary: ${row.Salary_Amount}")

# print("-" * 50)

# # Save the results to a text file
# file_path = "Employee_Report.txt"

# try:
#     with open(file_path, "w") as file:
#         file.write("📊 Employee Salary Report\n")
#         file.write("-" * 50 + "\n")
#         for row in results:
#             file.write(f"ID: {row.Employee_ID}, Name: {row.Employee_Name}, Salary: ${row.Salary_Amount}\n")
#         file.write("-" * 50 + "\n")
#     print(f"✅ Report successfully saved to {file_path}!")
# except Exception as e:
#     print("❌ Failed to write to file:", e)

# # Close the database connection
# conn.close()
# print("\n🔒 Database connection closed.")
