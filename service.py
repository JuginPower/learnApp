from models import Fach, Thema, Quest


pk = 1

fach_manager = Fach()
thema_manager = Thema()
quest_manager = Quest()
fach_list = fach_manager.get_faecher(pk)
fach_manager.show_content("Fächer", fach_list)

fachname = fach_manager.ask_routine("Fach", fach_list)
fachnumber = fach_manager.get_id("fach_learn", "fach", fachname)
thema_list = thema_manager.get_thema(pk, fachnumber)
thema_manager.show_content("Themen", thema_list)
themaname = thema_manager.ask_routine("Thema", thema_list)
themanumber = thema_manager.get_id("thema_learn", "thema", themaname)

questions = quest_manager.get_questans("frage", themanumber)
answers = quest_manager.get_questans("antwort", themanumber, True)


def notenmaker():

    while True:

        weiter = input("\nEhrliche Selbsteinschätzung 'good' oder 'bad: ")

        if weiter != 'good' and weiter != 'bad':
            print("Flasche Eingabe")
            continue

        elif weiter == 'good':

            return 1

        elif weiter == 'bad':

            return 0


def time_maker(time_number):

    hours = time_number//(60*60)
    time_number -= 60*60*hours
    minutes = time_number//60
    time_number -= minutes*60
    seconds = time_number

    string_hours = number_to_string(hours)
    string_minutes = number_to_string(minutes)
    string_seconds = number_to_string(seconds)

    return string_hours + ":" + string_minutes + ":" + string_seconds


def number_to_string(number):

    if number < 10:

        return "0"+str(number)

    else:

        return str(number)