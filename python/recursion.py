# Recursion: Self calling function

# Use case
# Problem 100 Number assigned to everyone
# If student did not come to the class cut 10 everytime
# 100 - 10, 90 - 10, 80 - 10 => 70
# 100 - 10, 90 - 10, 80 - 10, 70 - 10 => 60
#
# number = 100
#
# def absent():
#     global number
#     number = number - 10
#
#
# def result(times):
#     if times == 1:
#         absent()
#     if times == 2:
#         absent()
#         absent()
#     if times == 3:
#         absent()
#         absent()
#         absent()


def result(number, times):
    if number <= 0:
        return
    if times <= 0:
       return

    number = number - 10
    times = times - 1

    result(number, times)
    return number

# vishal_number = 100
# output = result(vishal_number, 5)
# print("Output: ", output)

# niyati = 100
# result(niyati, 6)
# print(niyati)


def minus_two(input_number):
    output_number = input_number - 2
    return output_number


# number = 10
# output = minus_two(number)
# print(output)



def minus_1(input_number):  # 100
    output_number = input_number - 1 # 100 -2
    return output_number # 98


def minus_1(input, times):
    if times == 0:
        return input
    output = minus_1(input - 1, times - 1)
    return output

# output = minus_1(100, 10)
# print(output)


def decreasing(number):
    if number <= 0:
        return
    print(number)
    decreasing(number-1)


decreasing(5)
