


class Searcher:

    def __init__(self):
        
        self.fach_name = ""
        self.thema_name = ""

    def get_name(self, key_str, value_str):

        """
        Der keystr bezeichnet den key der gemeint ist.
        Der value_str ist der value der in die globalen variablen eingesetzt wird.
        """

        if key_str == "fach":
            
            self.fach_name = value_str

        elif key_str == "thema":
            
            self.thema_name = value_str
