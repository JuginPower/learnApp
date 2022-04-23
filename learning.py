import time
from random import shuffle
from datetime import datetime
from models import Fach, Thema, Quest


class Learner:

    def learn(self):

        data = self.load_data()
        index_list = [n for n in range(len(data["fragen"]))]
        punkte = []
        shuffle(index_list)
        today = datetime.today().date()
        start = int(time.time())

        print("Sie können jederzeit 'q' drücken um das Programm zu beenden.")

        while index_list:
            index_number = index_list.pop()
            print()
            print(data["fragen"][index_number]+"\n")
            
            enter = input("Drücken Sie eine beliebige Tasten und/oder Enter um weiter zu machen: ")
            print()
            print(data["antworten"][index_number])

            if enter == "q":

                print("Das Programm wird nun beendet.")
                break

            punkt = self.notenmaker()
            punkte.append(punkt)

        end = int(time.time())
        dauer = self.time_maker(end-start)
        note = int(sum(punkte)/len(punkte)*100)
        fachname = data["fach"]
        themaname = data["thema"]
        log_string = f"[Datum: {today} \tDauer: {dauer} \tErfolgsquote: {note}% \tFach: {fachname.title()} \tThema: {themaname.title()}]"
        print(log_string)

    def load_data(self, pk=1):

        fach_manager = Fach()
        thema_manager = Thema()
        quest_manager = Quest()
        fach_list = fach_manager.get_faecher(pk)
        self.show_content("Fächer", fach_list)

        fachname = self.ask_routine("Fach", fach_list)
        fachnumber = fach_manager.get_id(fachname)
        thema_list = thema_manager.get_thema(pk, fachnumber)
        self.show_content("Themen", thema_list)
        themaname = self.ask_routine("Thema", thema_list)
        themanumber = thema_manager.get_id(themaname)

        questions = quest_manager.get_questans("frage", themanumber)
        answers = quest_manager.get_questans("antwort", themanumber, True)

        return {"fach": fachname, "thema": themaname,"fragen": questions, "antworten": answers}

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
    
    def ask_routine(self, topic, item_list):

        name = ""

        while True:
            name = input(f"Welches {topic} möchten Sie auswählen?: ")

            if name in item_list or name == "q":
                break

            else:
                print(f"Das {topic} {name} existiert nicht, bitte versuchen Sie es erneut.")
                continue
        
        return name


    def notenmaker(self):

        while True:

            weiter = input("\nEhrliche Selbsteinschätzung 'good' oder 'bad: ")

            if weiter != 'good' and weiter != 'bad':
                print("Flasche Eingabe")
                continue

            elif weiter == 'good':

                return 1

            elif weiter == 'bad':

                return 0

    def time_maker(self, time_number):

        hours = time_number//(60*60)
        time_number -= 60*60*hours
        minutes = time_number//60
        time_number -= minutes*60
        seconds = time_number

        string_hours = self.number_to_string(hours)
        string_minutes = self.number_to_string(minutes)
        string_seconds = self.number_to_string(seconds)

        return string_hours + ":" + string_minutes + ":" + string_seconds

    def number_to_string(self, number):

        if number < 10:

            return "0"+str(number)

        else:

            return str(number)

    