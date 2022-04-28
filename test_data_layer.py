import unittest
from data_layer import DataBank


class TestDataLayer(unittest.TestCase):

    def setUp(self):

        self.dm = DataBank()
        self.list_results = self.dm.get_data("SELECT * FROM fach_learn")
        self.fach_id = self.dm.get_id("fach_learn", "fach", "Informatik")
        self.thema_id = self.dm.get_id("thema_learn", "thema", "Kabel")
        self.quest_id = self.dm.get_id("quest_learn", "thema_category", 22)
        self.fail_id = self.dm.get_id("fhjgh", "fxjh", "dhgh")
        self.fail_id2 = self.dm.get_id("fach_learn", "abc", "wirtschaft")

    def test_get_data(self):

        self.assertEqual(len(self.list_results), 5)
        self.assertIsInstance(self.list_results, list)

    def test_get_id(self):

        self.assertIsInstance(self.fach_id, int)
        self.assertIsInstance(self.thema_id, int)
        self.assertIsInstance(self.quest_id, int)
        self.assertTrue(self.fail_id, "Table fhjgh not found.")

    def test_get_false_id(self):

        self.assertTrue(self.fail_id2, "Column abc does not found.")


if __name__ == "__main__":

    unittest.main()