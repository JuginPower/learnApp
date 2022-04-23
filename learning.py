import time
from random import shuffle
from datetime import datetime
from service import Alfred

# Die Antworten wurden nicht vollständig gespeichert

sl = time.sleep
serv = Alfred()
data = serv.prepare_data()
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

    punkt = serv.notenmaker()
    punkte.append(punkt)

end = int(time.time())
dauer = serv.time_maker(end-start)
note = int(sum(punkte)/len(punkte)*100)
fachname = data["fach"]
themaname = data["thema"]
log_string = f"[Datum: {today} \tDauer: {dauer} \tErfolgsquote: {note}% \tFach: {fachname.title()} \tThema: {themaname.title()}]"
print(log_string)