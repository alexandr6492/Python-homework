import datetime
class Employee:
    def __init__(self, salary_per_day):
        self.salary_per_day = salary_per_day

    def check_salary(self, days):
        return self.salary_per_day * days

    def check_salary(self):
        today = datetime.date.today()
        first_day_of_month = datetime.date(today.year, today.month, 1)
        days_worked = 0

        current_day = first_day_of_month
        while current_day <= today:
            if current_day.weekday() < 5:
                days_worked += 1
            current_day += datetime.timedelta(days=1)

        return self.salary_per_day * days_worked


employee = Employee(300)
salary = employee.check_salary()
print(salary)


class Developer(Employee):
    def __init__(self, salary_per_day, tech_stack):
        super().__init__(salary_per_day)
        self.tech_stack = tech_stack

    def check_salary(self):

        return super().check_salary()


developer = Developer(150, ['Python', 'JavaScript', 'C++'])
salary = developer.check_salary()
print(salary)
print(developer.tech_stack)


class Developer(Employee):
    def __init__(self, salary_per_day, tech_stack):
        super().__init__(salary_per_day)
        self.tech_stack = tech_stack

    def check_salary(self):
        return super().check_salary()

    def __eq__(self, other):
        return len(self.tech_stack) == len(other.tech_stack)

    def __ge__(self, other):
        return len(self.tech_stack) >= len(other.tech_stack)

    def __lt__(self, other):
        return len(self.tech_stack) < len(other.tech_stack)

    def __gt__(self, other):
        return len(self.tech_stack) > len(other.tech_stack)

developer1 = Developer(100, ['Java', 'Python', 'C++'])
developer2 = Developer(200, ['Java', 'Python'])
developer3 = Developer(300, ['Python', 'HTML', 'JavaScript'])

print(developer1 == developer3)
print(developer1 < developer2)
print(developer1 > developer2)
print(developer3 >= developer2)
print(developer2 > developer1)



