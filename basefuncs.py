import re
from time import sleep as sl
import data_layer


fach_name = ""
thema_name = ""


def get_name(key_str, value_str):
    """
    Der keystr bezeichnet den key der gemeint ist.
    Der value_str ist der value der in die globalen variablen eingesetzt wird.
    """

    if key_str == "fach":
        global fach_name
        fach_name = value_str

    elif key_str == "thema":
        global thema_name
        thema_name = value_str


def show(jsobj, key, prompts):
    """In prompts sollte eine Liste als Parameter eingegeben werden."""

    print(f"Folegende {prompts[1]} stehen zur Auswahl:")
    for k in jsobj[key].keys():
        print("-" + k + "-")


def asker(jsobj, key, prompts, asking=True):
    """
    Der Key ist der Schlüssel für das dict.
    prompts ist eine vorgefertigte Liste mit Antwortsätzen.
    """

    show(jsobj, key, prompts)

    while True:

        value_str = input(f"Welches {prompts[0]}? ")

        try:
            value = jsobj[key][value_str]

        except KeyError:
            print(f"Das {prompts[0]} '{value_str}' existiert nicht, bitte versuchen Sie es nochmal.")
            sl(2)
            continue

        else:
            get_name(key, value_str)
            return value


def update_routine(dataobj): # Sollte ich einem Datamodel anfügen.
    """Eine Funktion zur Automatisierung des Updatesprozesses.
    Ein Datenobjekt wird benötigt.
    Die Datenbank wird hier aktualisiert"""

    show(dataobj, "fach", ["Fach", "Fächer"])
    error_prompt = "Ungültige Antwort, bitte versuchen Sie nochmal!"

    while True:
        decision = input("Wollen Sie ein neues Fach hinzufügen?(j/n) ")

        if decision == "j":
            neues_fach = new_topic("Fach")
            neues_thema = new_topic("Thema")
            values_dict = make_quest()
            updating_dict = {neues_fach: {"thema": {neues_thema: values_dict}}}
            dataobj["fach"].update(updating_dict)
            break

        elif decision == "n":
            second_ask = input("Wollen Sie ein Thema zu einem bestehenden Fach hinzufügen?(j/n) ")

            if second_ask == "j":
                asker(dataobj, "fach", ["Fach", "Fächer"])
                neues_thema = new_topic("Thema")
                values_dict = make_quest()
                dataobj["fach"][fach_name]["thema"].update({neues_thema: values_dict})
                break

            elif second_ask == "n":
                third_ask = input("Wollen Sie Fragen und Antworten zu einem bestehenden Thema hinzufügen?(j/n) ")

                if third_ask == "j":
                    asker(dataobj, "fach", ["Fach", "Fächer"])
                    asker(dataobj["fach"][fach_name], "thema", ["Thema", "Themen"])
                    values_dict = make_quest()
                    dataobj["fach"][fach_name]["thema"][thema_name]["fragen"].extend(values_dict["fragen"])
                    dataobj["fach"][fach_name]["thema"][thema_name]["antworten"].extend(values_dict["antworten"])
                    break

                elif third_ask == "n":
                    break

                else:
                    print(error_prompt)
                    sl(2)
                    continue

            else:
                print(error_prompt)
                sl(2)
                continue

        else:
            print(error_prompt)
            sl(2)
            continue

    data_layer.write_database(dataobj)


def get_fach():
    """Gibt ein weiter verschachteltes 'thema' dictionary zurück."""

    return asker(data_layer.read_database(), "fach", ["Fach", "Fächer"])


def get_thema(main_dict):
    """Gibt ein dictionary mit zwei key value pairs zurück: 'fragen' und 'antworten',
    die jeweils eine Liste beinhalten."""

    return asker(main_dict, "thema", ["Thema", "Themen"])


def get_thema_fach():
    """Zur weiteren Automatisierung gedacht um das finale Ergebnis der Abfrage zur weiteren Bearbeitung abzufragen.
    Gibt ein dictionary mit zwei key value pairs zurück: 'fragen' und 'antworten', die jeweils eine Liste beinhalten."""

    main_thema_dict = get_fach()
    return get_thema(main_thema_dict)


def new_topic(prompt):
    """Gibt ein neues Fach oder Thema oder was auch immer als prompt gefordert wird zurück."""

    while True:

        topic = input(f"Wie soll das neue {prompt} heißen? ")
        bool_result = regexer(topic)

        if bool_result:
            return topic

        elif not bool_result:
            print("Falsche Eingabe, bitte versuchen Sie es nochmal. ")
            sl(2)
            continue


def make_quest():

    values = {"fragen": [], "antworten": []}
    print("Sie können jederzeit 'q' drücken um die Eingabe zu beenden.")

    while True:

        frage = input("Wie soll die Frage heißen? ")

        if frage == "q":
            break

        antwort = input("Wie soll die Antwort heißen? ")

        if antwort == "q":
            break

        bool_result1 = regexer(frage)
        bool_result2 = regexer(antwort)

        if not bool_result1 and bool_result2:
            print("Falsche Eingabe, bitte versuchen Sie es nochmal. ")
            sl(2)
            continue

        else:
            values["fragen"].append(frage)
            values["antworten"].append(antwort)

    return values


def cut_string(rough_string):

    clean_string = ""
    counter = 0

    for s in rough_string:
        counter += 1
        clean_string += s

        if counter > 100 and s == " " or s == ".":

            clean_string += "\n"
            counter = 0

    return clean_string


def regexer(test_string, rule="[a-zA-Z]"):

    regex = re.search(rule, test_string)

    if regex:

        return True

    else:

        return False


def formator(column_name):

    while True:

        test_format = input(f"Please type the format of the '{column_name}': ")
        regex = regexer(test_format, "(int|integer|blob|text|real)")

        if regex:

            return test_format

        else:
            print("Please type the right format:\n(int, blob, text or real)!")
            sl(2)
            continue


def decider():

    while True:

        more = input("Do you want more?\n(n/y): ")

        if more == "y":

            return True

        elif more == "n":

            return False

        else:

            print("Wrong answer. Please try again.")
            sl(2)
            continue

