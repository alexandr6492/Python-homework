name = input('What is your name?')
a = 'V'
b = 'v'
if a or b in name:
    print('correctly')
else:
    print('incorrectly')
age = int(input('How old are you?'))
if age % 2:
    print('You win!')
else:
    print('You lose!')
