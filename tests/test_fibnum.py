import unittest

from app import fib_find


class TestFibonnaciResult(unittest.TestCase):
    def test_number(self):
        self.assertEqual(fib_find(5), 5)
        self.assertEqual(fib_find(6), 8)
        self.assertEqual(fib_find(7), 13)


# def test_input_type(self):
# self.assertRaises(TypeError, fib_find, "some-string")


if __name__ == "__main__":
    unittest.main()


# List of sequence
# https://www.planetmath.org/listoffibonaccinumbers#:~:text=%20%20%20Title%20%20%20list%20of,%20cvalente%20%2811260%29%20%205%20more%20rows%20
