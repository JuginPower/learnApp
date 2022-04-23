import re
from models import Fach, Thema, Quest


class Updater:

    def insert_database(self):

        fachmodel = Fach()
        themamodel = Thema()
        error_prompt = "Ungültige Antwort, bitte versuchen Sie nochmal!"
        print("Sie können jederzeit 'q' drücken um die Eingabe zu beenden.")

        while True:
            decision = input("Wollen Sie ein neues Fach hinzufügen?(j/n) ")

            if decision == "j":
                neues_fach = self.new_topic("Fach")
                fachmodel.insert_fach(neues_fach)
                thema_decision = input("Wollen Sie ein Thema hinzufügen?(j/n) ") # Ein Thema
                
                if thema_decision == "j":
                    neues_thema = self.new_topic("Thema")
                    fach_id = fachmodel.get_id(neues_fach)
                    themamodel.insert_thema(neues_thema, fach_id)
                    quest_decision = input("Wollen Sie neue Fragen und Antworten hinzufügen?(j/n) ")

                    if quest_decision == "j":
                        thema_id = themamodel.get_id(neues_thema)
                        self.make_quest(fach_id, thema_id)

                    elif quest_decision == "n":
                        break

                    else:
                        print(error_prompt)
                        continue

                elif thema_decision == "n":
                    break

                else:
                    print(error_prompt)
                    continue

            elif decision == "n":
                break

            else:
                print(error_prompt)
                continue

    def make_quest(self, fkfach, fkthema):

        quest_manager = Quest()

        print("Sie können jederzeit 'q' drücken um die Eingabe zu beenden.")

        while True:

            frage = input("Wie soll die Frage heißen? ")

            if frage == "q":
                break

            antwort = input("Wie soll die Antwort heißen? ")

            if antwort == "q":
                break

            bool_result1 = self.regexer(frage)
            bool_result2 = self.regexer(antwort)

            if not bool_result1 and bool_result2:
                print("Falsche Eingabe, bitte versuchen Sie es nochmal.")
                continue

            quest_manager.insert_quest(frage, antwort, fkfach, fkthema)

    def new_topic(self, prompt):
        """Gibt ein neues Fach oder Thema oder was auch immer als prompt gefordert wird zurück."""

        while True:

            topic = input(f"Wie soll das neue {prompt} heißen? ")
            bool_result = self.regexer(topic)

            if bool_result:
                return topic

            elif not bool_result:
                print("Falsche Eingabe, bitte versuchen Sie es nochmal. ")
                continue

    def regexer(self, test_string, rule="[a-zA-Z]"):

        regex = re.search(rule, test_string)

        if regex:

            return True

        else:

            return False
