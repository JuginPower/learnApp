from unittest import result
import mysql.connector


mydb = mysql.connector.connect(
    user="root",
    host="localhost",
    password="",
    database="myprojects"
)
mycursor = mydb.cursor()


class DataBank:

    def get_id(self, tablename, attributname, valuename):

        """Get any id with the specified tablename, attributname and valuename for where"""

        sql = f"SELECT id from {tablename} WHERE {attributname}='{valuename}'"
        mycursor.execute(sql)
        result = mycursor.fetchall()
        return result[-1][-1]

    def get_data(self, sql):

        mycursor.execute(sql)
        result = mycursor.fetchall()
        
        if len(result) > 1:
            list_result = []
            for item in result:
                list_result.append(item[-1])
            return list_result

        else:
            return result[-1][-1]

    def insert_many(self, sql_string, values):

        mycursor.executemany(sql_string, values)
        mydb.commit()
        print("Rows inserted:", mycursor.rowcount)


dm = DataBank()
test_list = dm.get_data("SELECT fach FROM fach_learn WHERE fach_id=1")
print(test_list)