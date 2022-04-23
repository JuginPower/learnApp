from sre_compile import isstring
from data_layer import DataBank
from time import sleep as sl


class Fach(DataBank):  

    def get_faecher(self, fk_user):

        sql = f"SELECT fach FROM fach_learn WHERE fach_id={fk_user}"
        faecher_list = self.get_data(sql)
        return faecher_list

    def show_content(self, topic, item_list):

        print()
        prompt = f"Folgende {topic} stehen zur Auswahl:"
        bindestriche = ""
        print(prompt)

        for s in prompt:
            bindestriche += "-"

        print(bindestriche)

        if isinstance(item_list, list):

            for item in item_list:  
                print("-" + item + "-")

        else:
            print("-" + item_list + "-")

        print()
    
    def ask_routine(self, topic, item_list): # Sollte nicht im Datalayer liegen

        name = ""

        while True:
            name = input(f"Welches {topic} möchten Sie auswählen?: ")

            if name in item_list or name == "q":
                break

            else:
                print(f"Das {topic} {name} existiert nicht, bitte versuchen Sie es erneut.")
                sl(2)
                continue
        
        return name

    def update_fach(self):

        pass


class Thema(Fach):

    def get_thema(self, fk_user, fk_fach):

        sql = f"SELECT thema FROM thema_learn WHERE thema_id={fk_user} AND thema_category={fk_fach}"
        themen_list = self.get_data(sql)
        return themen_list


class Quest(Fach):

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