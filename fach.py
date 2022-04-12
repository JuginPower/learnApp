from data_layer import DataBank


class Fach(DataBank):

    def __init__(self):
        
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

    def update_fach(self):

        pass
