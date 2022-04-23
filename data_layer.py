import json
import mysql.connector


""" mydb = mysql.connector.connect(
    user="root",
    host="localhost",
    password="",
    database="myprojects"
)
 """


class DataBank:

    def __init__(self, user="root", host="localhost", password="", database="myprojects"):

        self._mydb = mysql.connector.connect(user, host, password, database)
        self._mycursor = self.mydb.cursor()

    def get_id(self, tablename, attributname, valuename):

        sql = f"SELECT id from {tablename} WHERE {attributname}='{valuename}'"
        self._mycursor.execute(sql)
        result = self._mycursor.fetchall()
        return result[-1][-1]

    def insert_many(self, sql_string, values):

        self._mycursor.executemany(sql_string, values)
        self._mydb.commit()
        print("Rows inserted:", self._mycursor.rowcount)