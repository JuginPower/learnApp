import json
from time import sleep as sl
import mysql.connector


mydb = mysql.connector.connect(
    user="root",
    host="localhost",
    password="",
    database="myprojects"
)
mycursor = mydb.cursor()


class DataBank:

    def read_json(self, pathname="data/database.json"):
        with open(pathname, "r", encoding="utf-8") as jsf:
            json_orig = json.load(jsf)

        return json_orig

    def write_json(self, jsnobj, pathname="data/database.json"):
        with open(pathname, "w", encoding="utf-8") as json_file:
            json.dump(jsnobj, json_file, indent=4)

    def get_id(self, tablename, attributname, valuename):

        sql = f"SELECT id from {tablename} WHERE {attributname}='{valuename}'"
        mycursor.execute(sql)
        result = mycursor.fetchall()
        return result[-1][-1]

    def insert_many(self, sql_string, values):

        mycursor.executemany(sql_string, values)
        mydb.commit()
        print("Rows inserted:", mycursor.rowcount)