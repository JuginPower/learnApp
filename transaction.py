import json
import mysql.connector


mydb = mysql.connector.connect(
    user="root",
    host="localhost",
    password="",
    database="myprojects"
)
mycursor = mydb.cursor()
vals = []

with open("data/database.json", "r", encoding="utf-8") as fj:

    content = json.load(fj)

######################################

sql = "INSERT INTO thema_learn (frage, antwort, quest_id, fach_category, thema_category) VALUES (%s, %s, %s, %s, %s)"
person_id = 1
fach_ids = [number+1 for number in range(len(content["fach"]))]
themaidnumber = 0

for key in content["fach"].keys():

    len_thema = len(content["fach"][key]["thema"])
    themaidnumber += len_thema

thema_ids = [number+1 for number in range(themaidnumber)] # Wichtig für die Fragen und Antworten


for key in content["fach"].keys():

    fach_id = fach_ids.pop(0)

    for key_thema in content["fach"][key]["thema"].keys():

        thema_id = thema_ids.pop(0)

        for item in content["fach"][key]["thema"][key_thema].values(): # Die SChleife muss überarbeitet werden

            frage = content["fach"][key]["thema"][key_thema]["fragen"].pop(0)
            antwort = content["fach"][key]["thema"][key_thema]["antworten"].pop(0)
            val = tuple([frage, antwort, person_id, fach_id, thema_id])
            vals.append(val)


######################################
mycursor.executemany(sql, vals)
print()
mydb.commit()
print(mycursor.rowcount, "rows inserted")