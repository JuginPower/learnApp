import unittest
from data_layer import DataBank


class TestDataLayer(unittest.TestCase): 

    def setUp(self):

        self.dm = DataBank()

    def test_should_get_one_id(self):

        one_user_id = self.dm.get_id("user_learn", "passwort", "balthazarkraft90")
        one_fach_id = self.dm.get_id("fach_learn", "fach", "Informatik")
        one_thema_id = self.dm.get_id("thema_learn", "thema", "ökoprinzip")

        self.assertIsInstance(one_user_id, int)
        self.assertIsInstance(one_fach_id, int)
        self.assertIsInstance(one_thema_id, int)


    def test_should_get_multy_ids(self):

        multiple_ids = self.dm.get_id("thema_learn", "thema_category", 3)
        self.assertIsInstance(multiple_ids, list)
        self.assertGreater(len(multiple_ids), 1)

    def test_should_get_an_error_from_get_id(self):

        id_error = self.dm.get_id("thema_learn", "thema_cat", 99)
        self.assertIsInstance(id_error, str)

    def test_should_get_a_list_from_get_data(self):

        sqlstr = "SELECT * FROM thema_learn WHERE id=7"
        one_row_of_data = self.dm.get_data(sqlstr)
        self.assertIsInstance(one_row_of_data, list)
        self.assertGreater(len(one_row_of_data), 1)

    def test_should_get_one_str_from_get_data(self):

        sqlstr = "SELECT fach FROM fach_learn WHERE fach_id=1 AND id=3"
        one_str = self.dm.get_data(sqlstr)
        self.assertIsInstance(one_str, str)

    def test_should_get_an_integer_from_get_data(self):

        sqlstr = "SELECT id FROM fach_learn WHERE fach='Informatik'"
        one_number = self.dm.get_data(sqlstr)
        self.assertIsInstance(one_number, int)

    def test_should_get_an_errorstring_from_get_data(self):

        sqlstr = "SELECT id FROM fach_learn WHERE fach='Babylon'"
        error_string = self.dm.get_data(sqlstr)
        self.assertIsInstance(error_string, str)

        


if __name__ == "__main__":

    unittest.main()