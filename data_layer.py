import json


def read_database(pathname="data/database.json"):
    with open(pathname, "r", encoding="utf-8") as jsf:
        json_orig = json.load(jsf)

    return json_orig


def write_database(jsnobj, pathname="data/database.json"):
    with open(pathname, "w", encoding="utf-8") as json_file:
        json.dump(jsnobj, json_file, indent=4)
