# https://www.codewars.com/kata/54147087d5c2ebe4f1000805/train/python
def say_hello():
    print("Hello")

def say_goodbye():
    print("Goodbye")

_if(True, say_hello, say_goodbye)

_if(False, say_hello, say_goodbye)





# https://www.codewars.com/kata/5467e4d82edf8bbf40000155/train/python


def descending_order(num):
    str_num = str(num)

    sorted_digits = sorted([int(digit) for digit in str_num], reverse=True)

    sorted_str_num = ''.join(map(str, sorted_digits))

    return int(sorted_str_num)



# https://www.codewars.com/kata/55902c5eaa8069a5b4000083/train/python

def format_money(amount):
    return '${:.2f}'. format(amount)


