from data_layer import DataBank
from time import sleep as sl


class Fach(DataBank): 

    def __init__(self, pk, fk_user):
        
        self.__data = self.read_database()
        self.fachdata = ""

    def get_fach(self, name):

        self.fachdata = self.__data["fach"].get(name)

    def show_content(self):

        prompt = "Folgende Fächer stehen zur Auswahl:"
        bindestriche = ""
        print(prompt)

        for number in range(len(prompt)):
            bindestriche += "-"

        print(bindestriche)

        for key in self.__data["fach"].keys():
            print("-" + key + "-")

        print()

    def ask_fach(self):

        fach_list = [k for k in self.__data["fach"].keys()]
        self.show_content()
        fach_name = self.ask_routine("Fach", fach_list)
        self.get_fach(fach_name)
    
    def ask_routine(self, prompt, values): # Sollte nicht im Datalayer liegen

        name = ""

        while True:
            name = input(f"Welches {prompt} möchten Sie auswählen?: ")

            if name in values or name == "q":
                break

            else:
                print(f"Das {prompt} {name} existiert nicht, bitte versuchen Sie es erneut.")
                sl(2)
                continue
        
        return name

    def update_fach(self):

        pass
