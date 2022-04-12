import json
from time import sleep as sl


class DataBank:

    def read_database(self, pathname="data/database.json"):
        with open(pathname, "r", encoding="utf-8") as jsf:
            json_orig = json.load(jsf)

        return json_orig

    def write_database(self, jsnobj, pathname="data/database.json"):
        with open(pathname, "w", encoding="utf-8") as json_file:
            json.dump(jsnobj, json_file, indent=4)

    def ask_routine(self, prompt, values):

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