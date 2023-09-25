from math import pi, sqrt


class Circle:
    def __init__(self, r) -> object:
        self.r = r

    def get_square(self):
        return pi * self.r ** 2

    def print_result(self):
        print(f'Square of circle: {self.get_square()}')


class Triangle:
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def get_square(self):
        p = (self.a + self.b + self.c) / 2
        return sqrt(p * (p - self.a) * (p - self.b) * (p - self.c))

    def check_triangle(self):
        if (self.a ** 2 + self.b ** 2 == self.c ** 2) or (self.b ** 2 + self.c ** 2 == self.a ** 2) or (
                self.a ** 2 + self.c ** 2 == self.b ** 2):
            print(f'Right angled triangle')
        else:
            print(f'Not right angled triangle')

    def print_result(self):

        print(f'Square of triangle: {self.get_square()}')
