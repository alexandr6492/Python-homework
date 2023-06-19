import unittest
from company import Recruiter


class TestRecruiter(unittest.TestCase):
    def test_recruiter_name(self):
        recruiter = Recruiter("Vasya Popov", 7000, "2023-12-01")
        self.assertEqual(recruiter.name, "Vasya Popov")

    def test_recruiter_salary(self):
        recruiter = Recruiter("Vasya Popov", 7000, "2023-12-01")
        self.assertEqual(recruiter.salary, 7000)

    def test_recruiter_hire_date(self):
        recruiter = Recruiter("Vasya Popov", 7000, "2023-12-01")
        self.assertEqual(recruiter.hire_date, "2023-12-01")

if __name__ == "__main__":
    unittest.main()
