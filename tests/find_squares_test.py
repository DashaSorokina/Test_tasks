from unittest import TestCase, main
from figures import Circle, Triangle


class CircleTest(TestCase):
    def test_get_square(self):
        self.assertEqual(Circle(3).get_square(), 28.27)

    def test_invalid_type(self):
        with self.assertRaises(TypeError):
            Circle("jfnfjrn")

    def test_negative_radius(self):
        with self.assertRaises(ValueError):
            Circle(-1)


class TriangleTest(TestCase):
    def test_invalid_type(self):
        with self.assertRaises(TypeError):
            Triangle("ifjk", 2.0, 3)

    def test_get_square(self):
        self.assertEqual(Triangle(4, 3, 5).get_square(), 6.00)

    def test_existence_of_triangle(self):
        with self.assertRaises(ValueError):
            Triangle(1, 2, 3)

    def test_negative_side(self):
        with self.assertRaises(ValueError):
            Triangle(3, -1, 4)


if __name__ == '__main__':
    main()
