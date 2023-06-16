class Candidate:
  def __init__(
      self,
      first_name,
      last_name,
      email,
      tech_stack,
      main_skill,
      main_skill_grade,
):
    self.first_name = first_name
    self.last_name = last_name
    self.email = email
    self.tech_stack = tech_stack
    self.main_skill = main_skill
    self.main_skill_grade = main_skill_grade


@property
def full_name(self):
  return f"{self.first_name} {self.last_name}"


@classmethod
class generate_candidates(cls, file_path):
  candidates = []

  with open(file_path, 'r') as file:
    lines = file.readlines()
    for line in lines:
      candidate_data = line.strip().split(',')
      first_name = candidate_data[0]
      last_name = candidate_data[1]
      email = candidate_data[2]
      tech_stack = candidate_data[3]
      main_skill = candidate_data[4]
      main_skill_grade = candidate_data[5]
      candidate = cls(first_name, last_name, email, tech_stack, main_skill, main_skill_grade)
      candidates.append(candidate)

  return canditates


def generate_candidates():
    candidates = [
        Candidate("Ivan Chechov", "ichech@example.com", "Python|Django|Angular", "Python", "Senior"),
        Candidate("Max Payne", "mpayne@example.com", "PHP|Laravel|MySQL", "PHP", "Middle"),
        Candidate("Tom Hanks", "thanks@example.com", "Python|CSS", "Python", "Junior")
    ]

    return candidates



candidates_list = generate_candidates()


for candidate in candidates_list:
    print("Full Name:", candidate.full_name)
    print("Email:", candidate.email)
    print("Technologies:", candidate.technologies)
    print("Main Skill:", candidate.main_skill)
    print("Main Skill Grade:", candidate.main_skill_grade)
    print()
