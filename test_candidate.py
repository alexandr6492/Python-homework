import unittest
from company import Candidate


class TestCandidate(unittest.TestCase):
    def test_candidate_full_name(self):
        candidate = Candidate("Ivan Ivanov", "ivan.iv@gmail.com")
        self.assertEqual(candidate.full_name, "Ivan Ivanov")

    def test_candidate_email(self):
        candidate = Candidate("Ivan Ivanov", "ivan.iv@gmail.com")
        self.assertEqual(candidate.email,"ivan.iv@gmail.com")


if __name__ == "__main__":
    unittest.main()