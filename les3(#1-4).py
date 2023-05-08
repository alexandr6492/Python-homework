my_list = [num for num in range(10)]
suma = 0

for i in my_list:
    suma += 1
    print(suma)


l = list(range(1, 10))
suma = 0
len_l = len(l)
id_l = 0

while (id_l < len_l):
    suma += l[id_l]
    id_l += 1

print(suma)


import sys
filename = sys.argv[0]

f = open(filename, 'r')
for line in f:
    print(line)
f.close()




price = int(input('введите сумму:'))

my_list = [1000, 500, 200, 100, 50, 20, 10]


for i in my_list:
    print(f'купюр по {i}: {price // i}')
    price %= 1
    if not price:
        break




