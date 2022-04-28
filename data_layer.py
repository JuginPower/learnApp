import mysql.connector


mydb = mysql.connector.connect(
    user="root",
    host="localhost",
    password="",
    database="test"
)
mycursor = mydb.cursor(buffered=True)


class DataBank:

    def get_id(self, tablename, attributname, valuename):

        """Get any id with the specified tablename, attributname and valuename for where"""

        sql = f"SELECT id from {tablename} WHERE {attributname}='{valuename}'"

        try:
            mycursor.execute(sql)
            
        except mysql.connector.errors.ProgrammingError as programerror:
            return programerror
        
        except mysql.connector.errors.InterfaceError as interfaceerror:
            return interfaceerror

        else:
            result = mycursor.fetchall()
            
            try:
                returning_value = result[-1][-1]
            except IndexError as indexerror:
                return indexerror
            else:
                return returning_value


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

    def insert_data(self, sql_string, values):

        try:
            if isinstance(values, list):
                mycursor.executemany(sql_string, values)

            elif isinstance(values, tuple):
                mycursor.execute(sql_string, values)

        except mysql.connector.errors.ProgrammingError as programerror:
            return programerror
        
        except mysql.connector.errors.InterfaceError as interfaceerror:
            return interfaceerror

        else:

            mydb.commit()
            print("Rows inserted:", mycursor.rowcount)
            return mycursor.rowcount
