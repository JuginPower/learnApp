from time import sleep as sl


print("Sie können auch 'q' drücken um das Programm jetzt zu beenden.")
while True:

    decision = input("Wollen Sie updaten oder lernen?(u/l) ")

    if decision == "q":
        print("Ok, bye!")
        break

    if decision == "u":
        import updater
        break

    elif decision == "l":
        import learning
        break

    else:
        print("Ungültige Antwort, bitte versuchen Sie nochmal.")
        sl(2)
        continue
