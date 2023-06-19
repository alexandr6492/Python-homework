import unittest
from company import Developer

class TestDeveloper(unittest.TestCase):
    def test_developer_name(self):
        developer = Developer("Ivan Ivanov", 9000, "Python")
        self.assertEqual(developer.name, "Ivan Ivanov")

    def test_developer_salary(self):
        developer = Developer("Ivan Ivanov", 9000, "Python")
        self.assertEqual(developer.salary, 9000)

    def test_developer_programming_language(self):
        developer = Developer("Ivan Ivanov", 9000, "Python")
        self.assertEqual(developer.programming_language, "Python")

if __name__ == "__main__":
    unittest.main()