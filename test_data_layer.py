import unittest
from data_layer import DataBank


class TestDataLayer(unittest.TestCase):

    def setUp(self):

        self.dm = DataBank()
        self.list_results = self.dm.get_data("SELECT * FROM fach_learn")

    def test_get_data(self):

        self.assertEqual(len(self.list_results), 5)
        self.assertIsInstance(self.list_results, list)
        


if __name__ == "__main__":

    unittest.main()