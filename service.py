

class Alfred():

    """BF from Batman"""

    def show_content(self, topic, item_list):

        print()
        prompt = f"Folgende {topic} stehen zur Auswahl:"
        bindestriche = ""
        print(prompt)

        for s in prompt:
            bindestriche += "-"

        print(bindestriche)

        if isinstance(item_list, list):

            for item in item_list:  
                print("-" + item + "-")

        else:
            print("-" + item_list + "-")

        print()

    def ask_routine(self, topic, item_list):

        name = ""

        while True:
            name = input(f"Welches {topic} möchten Sie auswählen?: ")

            if name in item_list or name == "q":
                break

            else:
                print(f"Das {topic} {name} existiert nicht, bitte versuchen Sie es erneut.")
                continue
        
        return name
    