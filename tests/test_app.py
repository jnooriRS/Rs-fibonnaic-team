import app


# def test_fibonacci():
#     # Given
#     user_input = "5"
#     excepted_output = 5
#     # When
#     output = fibonacci(user_input)
#     # Then
#     assert output == excepted_output


def test_fib_find_1():
    assert app.fib_find("1") == 0


def test_fib_find_5():
    assert app.fib_find("5") == 5


def test_fib_find_10():
    assert app.fib_find("10") == 55
