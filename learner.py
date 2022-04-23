from datetime import datetime
from models import Fach, Thema, Quest


pk = 1

fach_manager = Fach()
thema_manager = Thema()
quest_manager = Quest()
fach_list = fach_manager.get_faecher(pk)
fach_manager.show_content("Fächer", fach_list)

fachname = fach_manager.ask_routine("Fach", fach_list)
fachnumber = fach_manager.get_id("fach_learn", "fach", fachname)
thema_list = thema_manager.get_thema(pk, fachnumber)
thema_manager.show_content("Themen", thema_list)
themaname = thema_manager.ask_routine("Thema", thema_list)
themanumber = thema_manager.get_id("thema_learn", "thema", themaname)

questions = quest_manager.get_questans("frage", themanumber)
answers = quest_manager.get_questans("antwort", themanumber)
print()