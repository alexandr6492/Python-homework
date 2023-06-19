import unittest
from company import Employee


class TestEmployee(unittest.TestCase):
    def test_employee_name(self):
        employee = Employee("Ivan Ivanov", 3000)
        self.assertEqual(employee.name, "Ivan Ivanov")


    def test_employee_salary(self):
        employee = Employee("Ivan Ivanov", 3000)
        self.assertEqual(employee.salary, 3000)


if __name__ == "__main__":
    unittest.main()
