"""
===========================================================
Python Tutorial: Fundamental Data Types
===========================================================

This tutorial covers Python's fundamental data types, including:
1. Numbers (int, float, complex)
2. Strings
3. Type Casting
4. Boolean values and operations

Each section contains detailed explanations, practical examples, and
best practices to help you understand and apply these concepts.
"""

# ===========================================================
# Section 1: Numbers
# ===========================================================

# 1.1 Integer Numbers
"""
Integers (`int`) are whole numbers, positive or negative, without decimal points.
Common use cases include counting, indexing, and representing discrete values.
"""
int_example = 42
negative_int = -7
large_int = 10**18  # Python supports arbitrarily large integers
print(int_example, negative_int, large_int)  # Output: 42 -7 1000000000000000000

# 1.2 Floating-Point Numbers
"""
Floating-point numbers (`float`) are used for representing real numbers with decimals.
They are often used in calculations involving precision.
"""
float_example = 3.14
negative_float = -0.001
scientific_notation = 1.23e4  # Equivalent to 12300.0
print(float_example, negative_float, scientific_notation)  # Output: 3.14 -0.001 12300.0

# 1.3 Complex Numbers
"""
Complex numbers have a real and imaginary part, represented as `a + bj`.
Useful in scientific and engineering calculations.
"""
complex_number = 2 + 3j
print(complex_number.real)  # Output: 2.0 (real part)
print(complex_number.imag)  # Output: 3.0 (imaginary part)

# 1.4 Type Checking for Numbers
"""
Use `isinstance()` or `type()` to verify the type of a number.
"""
print(isinstance(42, int))  # Output: True
print(type(3.14) == float)  # Output: True

# ===========================================================
# Section 2: Strings
# ===========================================================

# 2.1 Introduction to Strings
"""
Strings (`str`) are sequences of characters enclosed in quotes (single or double).
They are commonly used for text manipulation and storage.
"""
string_example = "Hello, Python!"
multi_line_string = '''This is
a multi-line string.'''
print(string_example)  # Output: Hello, Python!
print(multi_line_string)  # Output: This is\na multi-line string.

# 2.2 String Methods
"""
Common string methods include:
- `lower()`: Converts to lowercase
- `upper()`: Converts to uppercase
- `strip()`: Removes leading/trailing whitespace
- `replace()`: Replaces parts of the string
"""
example_string = "  Python is Fun!  "
print(example_string.lower())  # Output: python is fun!
print(example_string.strip())  # Output: Python is Fun!
print(example_string.replace("Fun", "Awesome"))  # Output: Python is Awesome!

# 2.3 String Slicing
"""
Access substrings using slicing: `string[start:end:step]`.
"""
sample_string = "abcdef"
print(sample_string[1:4])  # Output: bcd
print(sample_string[::-1])  # Output: fedcba (reverse string)

# 2.4 String Formatting
"""
Use `f-strings` for concise and readable string formatting.
"""
name = "Alice"
age = 30
formatted_string = f"My name is {name}, and I am {age} years old."
print(formatted_string)  # Output: My name is Alice, and I am 30 years old.

# ===========================================================
# Section 3: Type Casting
# ===========================================================

# 3.1 Converting Between Types
"""
Python provides functions to convert data types:
- `int()`, `float()`, `str()`, `bool()`
"""
num_str = "42"
num_int = int(num_str)  # Converts string to integer
print(num_int, type(num_int))  # Output: 42 <class 'int'>

float_num = 3.99
int_from_float = int(float_num)  # Truncates decimal part
print(int_from_float)  # Output: 3

bool_val = bool(0)  # Converts to boolean (0 is False, non-zero is True)
print(bool_val)  # Output: False

# 3.2 Type Checking Before Conversion
"""
Always check type before casting to avoid runtime errors.
"""
input_value = "123"
if isinstance(input_value, str):
    converted_value = int(input_value)
    print(converted_value)  # Output: 123

# ===========================================================
# Section 4: Boolean Values and Operations
# ===========================================================

# 4.1 Introduction to Boolean
"""
Booleans (`bool`) have two values: `True` and `False`.
Useful in decision-making, conditional statements, and logical operations.
"""
true_val = True
false_val = False
print(true_val, false_val)  # Output: True False

# 4.2 Logical Operations
"""
Python supports logical operators:
- `and`: True if both operands are True
- `or`: True if at least one operand is True
- `not`: Negates the operand
"""
a, b = True, False
print(a and b)  # Output: False
print(a or b)  # Output: True
print(not a)  # Output: False

# 4.3 Boolean and Numbers
"""
Numbers can be cast to boolean:
- 0 is `False`, non-zero is `True`.
"""
print(bool(0))  # Output: False
print(bool(42))  # Output: True

# 4.4 Pitfalls with Booleans
"""
Avoid confusing `None`, empty collections, or objects with `False`.
"""
print(bool(None))  # Output: False
print(bool([]))  # Output: False (empty list)
print(bool(" "))  # Output: True (non-empty string)

# ===========================================================
# Best Practices and Common Mistakes
# ===========================================================

"""
1. Always check types using `isinstance()` before performing operations.
2. Avoid implicit type conversions to prevent unexpected behavior.
3. Use descriptive variable names that reflect their types and purpose.
4. Handle edge cases like empty strings, None, and large numbers carefully.
"""

"""
===========================================================
End of Python Fundamental Data Types Tutorial
===========================================================
"""