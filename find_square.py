from figures import Triangle, Circle

c1 = Circle(5)
c2 = Circle(17)
c3 = Circle(1)

t1 = Triangle(5, 4, 3)
t2 = Triangle(8, 12, 5)
t3 = Triangle(6, 8, 9)

figures = [c1, t1, t2, c2, c3, t3]
for shape in figures:
    shape.print_result()

t1.check_triangle()
t3.check_triangle()
