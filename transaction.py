import mysql.connector


mydb = mysql.connector.connect(
    user="root",
    host="localhost",
    password="",
    database="myprojects"
)

print(mydb)