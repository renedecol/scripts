#!/usr/bin/python3

import sys

CRED = '\033[91m'
CBLUE = '\33[34m'
CEND = '\033[0m'

if len(sys.argv ) == 1:
    print("argument needed")
    print(sys.argv[0] + " Wert [toggleBit]" )
    exit(0)

shift = 0

inp=sys.argv[1]

if len(sys.argv ) == 3:
    if sys.argv[2] == "shift":
        shift = 1


if inp[0] == '0' and inp[1] == 'x':
    zahl= int(inp , 16)
else:
    zahl= int(inp , 10)


print( CRED +  '' +  CEND , end=' ')

if shift == 1:
    sft = zahl
    zahl = 1 << sft


print("Dezimal:")
print(zahl)
print("Hexadezimal:")
print(hex(zahl))


for n in range(31, -1, -1):
    print('%2d' % n, end=' ')
    if  ( n % 4) == 0 :
        if n != 0:
            print(' ', end='')

print()


for n in range(31, -1, -1):
    mask = 1 << n
    b = int(zahl) & int(mask)
    if b > 0:
        print( CRED +  ' 1' +  CEND , end=' ')
    else:
        print('%2d' % int(0), end=' ')

    if  ( n % 4) == 0 :
        if n != 0:
            print(' ', end='')
print()


# operate with toggle bit
if len(sys.argv ) == 3 and shift == 0:
    print()
    toggle =int(sys.argv[2])
    print("Mit Bit " + str(toggle) + " invertiert")
    tmask = 1 << toggle
    isBit = zahl & tmask
    if isBit > 0:
        zahl = zahl - tmask
    else:
        zahl = zahl |  tmask
    print("Dezimal:")
    print(zahl)
    print("Hexadezimal:")
    print(hex(zahl))

    for n in range(31, -1, -1):
        print('%2d' % n, end=' ')
        if  ( n % 4) == 0 :
            if n != 0:
                print(' ', end='')

    print()


    for n in range(31, -1, -1):
        mask = 1 << n
        b = int(zahl) & int(mask)
        if b > 0:
            print( CRED +  ' 1' +  CEND , end=' ')
        else:
            print('%2d' % int(0), end=' ')

        if  ( n % 4) == 0 :
            if n != 0:
                print(' ', end='')

    print()
