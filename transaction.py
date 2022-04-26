import json
import data_layer


vals = []

dm = data_layer.DataBank()

with open("data/database.json", "r", encoding="utf-8") as jf:
    json_data = json.load(jf)


person_id = 1

######################################
sql = "INSERT INTO quest_learn (frage, antwort,	quest_id, fach_category, thema_category) VALUES (%s, %s, %s, %s, %s)"

for key in json_data["fach"].keys():

    fach_category = dm.get_id("fach_learn", "fach", key)

    for thema in json_data["fach"][key]["thema"].keys():

        quest_dict = json_data["fach"][key]["thema"].get(thema)
        thema_category = dm.get_id("thema_learn", "thema", thema)
        print()

        while True:

            if len(quest_dict["fragen"]) == 0 or len(quest_dict["antworten"]) == 0:

                break
            
            frage = quest_dict["fragen"].pop(0)
            antwort = quest_dict["antworten"].pop(0)
            insert_row = tuple([frage, antwort, person_id, fach_category, thema_category])
            vals.append(insert_row)


######################################
dm.insert_data(sql, vals, True)