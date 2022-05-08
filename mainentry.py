from learning import Learner
from updating import Updater



print("Sie können auch 'q' drücken um das Programm jetzt zu beenden.")
while True:

    decision = input("Wollen Sie updaten oder lernen?(u/l) ")

    if decision == "q":
        print("Ok, bye!")
        break

    if decision == "u":
        updatemanager = Updater()
        updatemanager.insert_database()
        break

    elif decision == "l":
        learnmanager = Learner()
        learnmanager.learn()
        break

    else:
        print("Ungültige Antwort, bitte versuchen Sie nochmal.")
        continue
