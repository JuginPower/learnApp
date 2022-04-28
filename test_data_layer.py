import unittest
from data_layer import DataBank


class TestDataLayer(unittest.TestCase): # Überarbeiten, besser bestimmte Sachen überlegen die schief gehen könnten aber nicht sollten

    def setUp(self):

        self.dm = DataBank()
        self.list_results = self.dm.get_data("SELECT * FROM fach_learn")
        self.fach_id = self.dm.get_id("fach_learn", "fach", "Informatik")
        self.thema_id = self.dm.get_id("thema_learn", "thema", "Kabel")
        self.quest_id = self.dm.get_id("quest_learn", "thema_category", 22)
        self.fail_id = self.dm.get_id("fhjgh", "fxjh", "dhgh")
        self.fail_id2 = self.dm.get_id("fach_learn", "abc", "wirtschaft")

        self.list_insert_values = [("bananen", 1, 1), ("äpfel", "1", "1"), ("ananase", 1, "1"), ("ananase")]
        # self.list_insert_values = [("bananen", 1, 1), ("äpfel", "1", "1"), ("ananase", 1, "1"), ("ananase", "1", 1)]
        # self.list_insert_values = [("bananen", 1, 1), ("äpfel", "1", "1"), ("ananase", 1, "1"), ("ananase")]
        self.sql_statement = "INSERT INTO thema_learn (thema, thema_id, thema_category) VALUES (%s, %s, %s)"

    def test_get_data(self):

        self.assertEqual(len(self.list_results), 5)
        self.assertIsInstance(self.list_results, list)

    def test_get_id(self):

        pass

    def test_get_false_id(self):

        self.assertEqual(self.fail_id, "Table fhjgh not found.")
        self.assertEqual(self.fail_id2, "Column abc not found.")
        self.assertEqual(self.thema_id, "Value Kabel for Column thema not found.")

    def test_insert_data_single(self):

        for value in self.list_insert_values:

            self.assertEqual(self.dm.insert_data(self.sql_statement, value), 1)

    def test_insert_data_multy(self):

        self.assertEqual(self.dm.insert_data(self.sql_statement, self.list_insert_values), 4)

    def test_insert_data_false(self):

        self.assertEqual(self.dm.insert_data(self.sql_statement, self.list_insert_values), "Data don´t match the structure while inserting")


if __name__ == "__main__":

    unittest.main()