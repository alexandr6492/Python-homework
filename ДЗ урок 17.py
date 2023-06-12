import traceback
from datetime import datetime


class EmailAlreadyExistsException(Exception):
    def __init__(self, email):
        self.email = self.email
        self.message = f"Email'{email}' already exists"

    def __str__(self):
        return self.message


class Employee:
    def __init__(self, name, email):
        self.name = name
        self.email = email
        self.save_email()

    def save_email(self):
        try:
            with open('emails.csv', 'a') as file:
                file.write(self.email + '\n')
        except IOError as e:
            print(f"Error when you try to save email: {e}")

    def validate(self):
        try:
            with open('emails.csv', 'r') as file:
                emails = file.read().splitlines()
                if self.email in emails:
                    raise EmailAlreadyExistsException(self.email)
                else:
                    print('Validate Email')
        except IOError as e:
            print(f"Error when you check your Email: {e}")
        except EmailAlreadyExistsException as e:
            self.log_exception(e)

    def log_exception(self):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        traceback_info = traceback.format_exc()

        log_message = f"{timestamp} | {traceback_info}\n"

        try:
            with open('logs.txt', 'a') as file:
                file.write(log_message)
        except IOError as e:
            print(f"Error writing to file logs.txt: {e}")


employee1 = Employee("Bob", "Bob421@int.com")
emoloyee2 = Employee("Lora", "lora@int.com") # Результат: EmailAlreadyExistsException









