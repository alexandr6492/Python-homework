def check_file(file_name):
    with open(file_name, 'r') as f:
        for line in f:
            parts = line.strip().split(';')
            num = list(map(int, parts[0].split()))
            avg = sum(num) // len(num)
            remainder = sum(num) % len(num)
            check_num = int(parts[1].split()[0])
            if check_num == avg and remainder:
                print(line.strip() + 'True')
            else:
                print(line.strip() + 'False')


check_file('1.txt')






def find_apartment(floor_count, apartments_per_floor, apartment_number):

    total_apartments = floor_count * apartments_per_floor


    entrance = (apartment_number - 1) // (apartments_per_floor * 1)


    floor = ((apartment_number - 1) % apartments_per_floor) + 1

    return f"Вам нужно подняться на {floor} этаж, подъезд номер  {entrance + 1}, чтобы найти квартиру номер {apartment_number}"


print(find_apartment(3, 1, 10))




def print_dimond(num):
    if num > 0 and num % 2 !=2:
        for i in range(1, num + 1, 2):
            print(' ' * ((num - i) // 2) + '*' * i)
        for i in range(num -2, 0, -2):
            print(' ' * ((num - i) // 2) + '*' * i)
    else:
        print('вводные данные только положительные')

number = int(input('Введите положительное нечетное число'))
print_dimond(number)
