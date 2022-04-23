import time
from random import shuffle
from datetime import datetime
import service

# Die Antworten wurden nicht vollständig gespeichert

sl = time.sleep
index_list = [n for n in range(len(service.questions))]
punkte = []
shuffle(index_list)
today = datetime.today().date()
start = int(time.time())

print("Sie können jederzeit 'q' drücken um das Programm zu beenden.")

while index_list:
    index_number = index_list.pop()
    print()
    print(service.questions[index_number]+"\n")
    
    enter = input("Drücken Sie eine beliebige Tasten und/oder Enter um weiter zu machen: ")
    print()
    print(service.answers[index_number])

    if enter == "q":

        print("Das Programm wird nun beendet.")
        break

    punkt = service.notenmaker()
    punkte.append(punkt)

end = int(time.time())
dauer = service.time_maker(end-start)
note = int(sum(punkte)/len(punkte)*100)
log_string = f"[Datum: {today} \tDauer: {dauer} \tErfolgsquote: {note}% \tFach: {service.fachname.title()} \tThema: {service.themaname.title()}]"
print(log_string)