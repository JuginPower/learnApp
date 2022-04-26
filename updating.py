import re
from models import Fach, Thema, Quest
from service import Alfred


class Updater(Alfred):

    def insert_database(self):

        fachmodel = Fach()
        themamodel = Thema()
        error_prompt = "Ungültige Antwort, bitte versuchen Sie nochmal!"
        print("Sie können jederzeit 'q' drücken um die Eingabe zu beenden.")

        while True:
            decision = input("Wollen Sie ein neues Fach hinzufügen?(j/n) ")

            if decision == "j":
                neues_fach = self.new_topic("Fach")
                
                thema_decision = input("Wollen Sie ein Thema hinzufügen?(j/n) ")
                
                if thema_decision == "j":
                    fachmodel.insert_fach(neues_fach)
                    neues_thema = self.new_topic("Thema")
                    fach_id = fachmodel.get_id(neues_fach)
                    
                    quest_decision = input("Wollen Sie neue Fragen und Antworten hinzufügen?(j/n) ")

                    if quest_decision == "j":
                        
                        themamodel.insert_thema(neues_thema, fach_id)
                        thema_id = themamodel.get_id(neues_thema)
                        self.make_quest(fach_id, thema_id)

                    elif quest_decision == "n":
                        
                        themamodel.insert_thema(neues_thema, fach_id)
                        break

                    else:
                        print(error_prompt)
                        continue

                elif thema_decision == "n":
                    fachmodel.insert_fach(neues_fach)
                    break

                else:
                    print(error_prompt)
                    continue

            elif decision == "n":

                thema_decision = input("Wollen Sie ein Thema zu einem bestehenden Fach hinzufügen?(j/n) ")

                if thema_decision == "j":

                    fachlist = fachmodel.get_faecher()
                    self.show_content("Fach", fachlist)
                    fach_name = self.ask_routine("Fach", fachlist)
                    fachid = fachmodel.get_id(fach_name)
                    themalist = themamodel.get_themen(fachid)
                    self.show_content("Themen", themalist)
                    thema_name = self.ask_routine("Thema", themalist)
                    themamodel.insert_thema(thema_name, fachid)

                    quest_decision = input("Wollen Sie neue Fragen und Antworten zu einem bestehendem Thema hinzufügen?(j/n) ")

                    if quest_decision == "j":
                        
                        themaid = themamodel.get_id(thema_name)
                        self.make_quest(fachid, themaid)

                    elif quest_decision == "n":
                        break

                    else:
                        print(error_prompt)
                        continue

                elif thema_decision == "n":
                    
                    quest_decision = input("Wollen Sie neue Fragen und Antworten zu einem bestehendem Thema hinzufügen?(j/n) ")

                    if quest_decision == "j":

                        fach_list = fachmodel.get_faecher()
                        self.show_content("Fächer", fach_list)
                        fachname = self.ask_routine("Fach", fach_list)
                        fachid = fachmodel.get_id(fachname)

                        themalist = themamodel.get_themen(fachid)
                        self.show_content("Themen", themalist)
                        themaname = self.ask_routine("Thema", themalist)
                        themaid = themamodel.get_id(themaname)
                        self.make_quest(fachid, themaid)

                    elif quest_decision == "n":
                        break

                    else:
                        print(error_prompt)
                        continue

                else:
                    print(error_prompt)
                    continue
            
            elif decision == "q":
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
