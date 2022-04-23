from service import Alfred 


"""Alfred help! I am poisoned"""

supervisor = Alfred()

print("Sie können auch 'q' drücken um das Programm jetzt zu beenden.")
while True:

    decision = input("Wollen Sie updaten oder lernen?(u/l) ")

    if decision == "q":
        print("Ok, bye!")
        break

    if decision == "u":
        supervisor.insert_database()
        break

    elif decision == "l":
        supervisor.learn()
        break

    else:
        print("Ungültige Antwort, bitte versuchen Sie nochmal.")
        continue
