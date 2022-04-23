from data_layer import DataBank, mycursor


class Fach(DataBank):

    def insert_fach(self, fachname, fk_user=1):

        sqlstring = "INSERT INTO fach_learn (fach, fach_id) VALUES (%s, %s)"
        self.insert_data(sqlstring, (fachname, fk_user))

    def get_id(self, valuename):

        """Get any id with the specified tablename, attributname and valuename for where"""

        sql = f"SELECT id FROM fach_learn WHERE fach='{valuename}'"
        mycursor.execute(sql)
        result = mycursor.fetchall()
        return result[-1][-1]

    def get_faecher(self, fk_user):

        sql = f"SELECT fach FROM fach_learn WHERE fach_id={fk_user}"
        faecher_list = self.get_data(sql)
        return faecher_list

    def update_fach(self):

        pass


class Thema(DataBank):

    def insert_thema(self, themaname, fk_fach, fk_user=1):

        sqlstring = "INSERT INTO thema_learn (thema, thema_id, thema_category) VALUES (%s, %s, %s)"
        self.insert_data(sqlstring, (themaname, fk_user, fk_fach))

    def get_id(self, valuename):

        """Get any id with the specified tablename, attributname and valuename for where"""

        sql = f"SELECT id FROM thema_learn WHERE thema='{valuename}'"
        mycursor.execute(sql)
        result = mycursor.fetchall()
        return result[-1][-1]

    def get_thema(self, fk_user, fk_fach):

        sql = f"SELECT thema FROM thema_learn WHERE thema_id={fk_user} AND thema_category={fk_fach}"
        themen_list = self.get_data(sql)
        return themen_list


class Quest(DataBank):

    def insert_quest(self, frage, antwort, fk_fach, fk_thema, fk_user=1):

        sqlstring = "INSERT INTO quest_learn (frage, antwort, quest_id, fach_category, thema_category) VALUES (%s, %s, %s, %s, %s)"
        self.insert_data(sqlstring, (frage, antwort, fk_user, fk_fach, fk_thema))

    def get_id(self, valuename):

        """Get any id with the specified tablename, attributname and valuename for where"""

        sql = f"SELECT id from quest_learn WHERE frage='{valuename}'"
        mycursor.execute(sql)
        result = mycursor.fetchall()
        return result[-1][-1]

    def get_questans(self, columnname, fk_thema, cleaning=False):

        sql = f"SELECT {columnname} from quest_learn WHERE thema_category={fk_thema}"
        item_list = self.get_data(sql)
        
        if cleaning == True:
            clean_strings = []
            for item in item_list:
                clean = self.cut_string(item)
                clean_strings.append(clean)
            return clean_strings

        else:
            return item_list

    def cut_string(self, roughstring):

        clean_string = ""
        counter = 0

        for s in roughstring:
            counter += 1
            clean_string += s

            if counter > 100 and s == " " or s == ".":
                clean_string += "\n"
                counter = 0

        return clean_string

""" 
test_fach = Fach()
test_fach_id = test_fach.get_id("wirtschaft")
test_thema = Thema()
test_thema_id = test_thema.get_id("güterarten")
test_quest = Quest()
test_quest_id = test_quest.get_id("Was ist die Rechenschaftspflicht?")
print() """