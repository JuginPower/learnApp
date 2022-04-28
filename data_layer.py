import mysql.connector


mydb = mysql.connector.connect(
    user="root",
    host="localhost",
    password="",
    database="myprojects"
)
mycursor = mydb.cursor(buffered=True)


class DataBank:

    def get_id(self, tablename, attributname, valuename):

        """Get any id with the specified tablename, attributname and valuename for where"""

        sql = f"SELECT id from {tablename} WHERE {attributname}='{valuename}'"

        try:
            mycursor.execute(sql)
            
        except mysql.connector.errors.ProgrammingError:

            try:
                mycursor.execute(f"SELECT id from {tablename}")
            except mysql.connector.errors.ProgrammingError:
                return f"Table {tablename} not found."
            else:
                return f"Column {attributname} does not found."

        else:
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

    def insert_data(self, sql_string, values, many=False):

        if many:
            mycursor.executemany(sql_string, values)

        else:
            mycursor.execute(sql_string, values)

        mydb.commit()
        print("Rows inserted:", mycursor.rowcount)
