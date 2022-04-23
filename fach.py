from data_layer import DataBank
from time import sleep as sl


class Fach(DataBank):  

    def get_faecher(self, fk_user):

        sql = f"SELECT fach FROM fach_learn WHERE fach_id={fk_user}"
        faecher_list = self.get_data(sql)
        return faecher_list

    def show_content(self, topic, item_list):

        prompt = f"Folgende {topic} stehen zur Auswahl:"
        bindestriche = ""
        print(prompt)

        for s in prompt:
            bindestriche += "-"

        print(bindestriche)

        for item in item_list:
            print("-" + item + "-")

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
