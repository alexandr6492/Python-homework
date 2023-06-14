def fizz_buzz(fizz, buzz, n):
    for i in range(1, n+1):
        if i % fizz == 0 and i % buzz == 0:
            print("FB", end=" ")
        elif i % fizz == 0:
            print("F", end=" ")
        elif i % buzz == 0:
            print("B", end=" ")
        else:
            print(i, end=" ")

fizz = int(input("Enter the number fizz: "))
buzz = int(input("Enter the number buzz: "))
n = int(input("Enter the third number: "))

fizz_buzz(fizz, buzz, n)
