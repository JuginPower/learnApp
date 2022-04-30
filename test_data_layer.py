import unittest
from data_layer import DataBank


class TestDataLayer(unittest.TestCase): # Überarbeiten, besser bestimmte Sachen überlegen die schief gehen könnten aber nicht sollten

    def setUp(self):

        self.dm = DataBank()

    def should_get_one_id(self):

        one_user_id = self.dm.get_id("user_learn", "passwort", "balthazarkraft90")
        one_fach_id = self.dm.get_id("fach_learn", "fach", "Informatik")
        one_thema_id = self.dm.get_id("thema_learn", "thema", "ökoprinzip")

        self.assertIsInstance(one_user_id, int)
        self.assertIsInstance(one_fach_id, int)
        self.assertIsInstance(one_thema_id, int)


    def should_get_multiple_ids(self):

        multiple_ids = self.dm.get_id("thema_learn", "thema_category", 3)
        self.assertIsInstance(multiple_ids, list)
        self.assertGreater(len(multiple_ids), 1)

    def should_get_catched_errorstrings(self):

        id_error = self.dm.get_id("thema_learn", "thema_cat", 99)
        self.assertEqual(id_error, "error")


if __name__ == "__main__":

    unittest.main()