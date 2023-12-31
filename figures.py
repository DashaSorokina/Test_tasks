from math import pi, sqrt


class Circle:
    def __init__(self, r):

        if not isinstance(r, (int, float)):
            raise TypeError("Radius should be an int or a float")
        
        if r < 0:
            raise ValueError("Radius must be a positive number")
      
        self.r = r

    def get_square(self):
        return round(pi * self.r ** 2, 2)

    def print_result(self):
        print(f'Square of circle: {self.get_square()}')


class Triangle:
    def __init__(self, a, b, c):
        if not isinstance(a, (int, float)) or not isinstance(b, (int, float)) or not isinstance(c, (int, float)):
            raise TypeError("Sides of triangle must be integers or floats")
        
        if a <= 0 or b <= 0 or c <= 0:
            raise ValueError("Sides of triangle must be positive")

        if (a + b <= c) or (a + c <= b) or (b + c <= a):
            raise ValueError("This triangle does not exist")

        self.a = a
        self.b = b
        self.c = c

    def get_square(self):
        p = (self.a + self.b + self.c) / 2
        return round(sqrt(p * (p - self.a) * (p - self.b) * (p - self.c)), 2)

    def check_triangle(self):
        if (self.a ** 2 + self.b ** 2 == self.c ** 2) or (self.b ** 2 + self.c ** 2 == self.a ** 2) or (
                self.a ** 2 + self.c ** 2 == self.b ** 2):
            print(f'Right angled triangle')
        else:
            print(f'Not right angled triangle')

    def print_result(self):

        print(f'Square of triangle: {self.get_square()}')
