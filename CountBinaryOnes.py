
def CountBinaryOnes (num):
    ones = 0
    while num:
        ones += num & 1
        num >>= 1
    return ones


x = int (input ("Enter the first number to be checked ") )
y = int (input ("Enter the second number to be checked ") )
first = CountBinaryOnes(x)
second = CountBinaryOnes(y)
bit_bal = first - second

if bit_bal == 0:
    print('Bit Balanced! |{}|-|{}| = {} - {} = 0'.format(x,y,first,second))
else:
    print ('Bit Biased!|{}|-|{}| = {} - {} = {}'.format(x,y,first,second,bit_bal))




