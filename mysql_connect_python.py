import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Root@12345",
    database="advance_python"
)

cursor = conn.cursor()
print("connect mysql")
# cursor.execute("SHOW TABLES")

# for table in cursor:
#     print(table)
