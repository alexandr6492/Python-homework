class Telephone:
    def __init__(self):
        self.number = None
        self.incoming_calls = 0

    def set_number(self, number):
        self.number = number

    def get_incoming_calls(self):
        return self.incoming_calls

    def receive_call(self):
        self.incoming_calls += 1

phone1 = Telephone()
phone1.set_number("098362974")
phone1.receive_call()
phone1.receive_call()

phone2 = Telephone()
phone2.set_number("074629273")
phone2.receive_call()
phone2.receive_call()
phone2.receive_call()

phone3 = Telephone()
phone3.set_number("0672524927")
phone3.receive_call()
phone3.receive_call()
phone3.receive_call()
phone3.receive_call()







