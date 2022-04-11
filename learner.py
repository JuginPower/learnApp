import time
from random import shuffle
from datetime import datetime
import basefuncs
import data_layer


fach_dict = basefuncs.get_fach()
thema_dict = basefuncs.get_thema(fach_dict)
number_list = [x for x in range(len(thema_dict["fragen"]))]

shuffle(number_list)
sl = time.sleep
start = int(time.time())
punkte = []
today = datetime.today().date()

print("Sie können jederzeit 'q' drücken um das Programm zu beenden.")

while number_list:

    index_number = number_list.pop()
    print()
    print(thema_dict["fragen"][index_number]+"\n")
    enter = input("Drücken Sie eine beliebige Tasten und Enter um weiter zu machen: ")
    long_string = basefuncs.cut_string(thema_dict["antworten"][index_number])
    print()
    print(long_string)

    if enter == "q":

        print("Das Programm wird nun beendet.")
        break

    punkt = basefuncs.notenmaker()
    punkte.append(punkt)


end = int(time.time())
dauer = basefuncs.time_maker(end-start)
note = int(sum(punkte)/len(punkte)*100)
log_string = f"[Datum: {today} \tDauer: {dauer} \tErfolgsquote: {note}% \tFach: {basefuncs.fach_name.title()} \tThema: {basefuncs.thema_name.title()}]"
jsondatabase = data_layer.read_database()
jsondatabase["log"].append(log_string)
print(log_string)
data_layer.write_database(jsondatabase)
