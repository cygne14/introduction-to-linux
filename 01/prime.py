#!/usr/bin/env python3

def main():
    is_prime = True # Place your computation here

    f = open("input.txt", "r")
    number = int(f.read())
    f.close()

    for x in range(2, number):
        if (number % x) == 0:
            is_prime = False
            break

    if number == 2:
        is_prime = True   

    if is_prime:
        print("true")
    else:
        print("false")

if __name__ == '__main__':
    main()
