from time import sleep as sl
import basefuncs
import data_layer


while True:

    datajson = data_layer.read_database()
    basefuncs.update_routine(datajson)

    ask = input("Wollen Sie nochmal?(j/n) ")

    if ask == "j":
        continue

    elif ask == "n":
        break

    else:
        print("Ungültige Antwort, bitte versuchen Sie es nochmal.")
        sl(2)
        continue

