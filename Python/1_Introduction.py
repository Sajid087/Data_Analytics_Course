"""
===========================================================
Python Tutorial Script: A Comprehensive Guide
===========================================================

This script introduces the Python programming language,
covering its history, design principles, syntax basics,
and coding practices. Each concept is presented with 
explanatory comments, examples, and expected outputs.
"""

# ===========================================================
# Section 1: Introduction to Python Programming Language
# ===========================================================

# 1.1 History of Python
"""
Python was created by Guido van Rossum in 1991. It was designed as an easy-to-learn,
high-level programming language that emphasizes readability and simplicity.

The name 'Python' does not refer to the snake but was inspired by the British
comedy series "Monty Python's Flying Circus."
"""

# 1.2 Core Philosophy and Design Principles
"""
Python follows the principles outlined in 'The Zen of Python' by Tim Peters:
- Beautiful is better than ugly.
- Simple is better than complex.
- Readability counts.
To view the full philosophy, run:
"""
import this  # Outputs "The Zen of Python"

# 1.3 Major Version Differences
"""
Python 2 vs Python 3:
- Python 2 (Legacy) reached end-of-life in 2020.
- Python 3 is the present and future. Key differences include:
  * print() as a function in Python 3 (vs a statement in Python 2).
  * Integer division returns a float in Python 3.
"""

# ===========================================================
# Section 2: Python's Fundamental Characteristics
# ===========================================================

# 2.1 Interpreted Language
"""
Python code is executed line-by-line by the Python interpreter,
which makes debugging easier.
"""
print("Hello, Python!")  # Output: Hello, Python!

# 2.2 Dynamic Typing
"""
Variables can change types dynamically. No need to declare types explicitly.
"""
my_var = 10       # Integer
print(my_var)     # Output: 10
my_var = "Python" # Now a string
print(my_var)     # Output: Python

# 2.3 Object-Oriented Features
"""
Python supports classes and objects to build modular, reusable code.
"""
class Greeting:
    def say_hello(self):
        return "Hello, Object-Oriented Python!"

greet = Greeting()
print(greet.say_hello())  # Output: Hello, Object-Oriented Python!

# 2.4 High-Level Programming
"""
Python abstracts many complexities, making it ideal for beginners.
For example, memory management is automatic.
"""

# ===========================================================
# Section 3: Python Syntax Basics
# ===========================================================

# 3.1 Variable Declarations and Naming Conventions
"""
- Variables should start with a letter or underscore.
- Use snake_case for variable names.
"""
first_name = "John"
last_name = "Doe"
print(first_name, last_name)  # Output: John Doe

# 3.2 Basic Data Types
"""
- Integer (int)
- Float (float)
- String (str)
- Boolean (bool)
"""
age = 25         # int
height = 5.9     # float
name = "Alice"   # str
is_student = True # bool
print(age, height, name, is_student)  # Output: 25 5.9 Alice True

# 3.3 Indentation Rules
"""
Python uses indentation (spaces or tabs) to define code blocks.
Improper indentation will raise an error.
"""
if age > 18:
    print("Adult")  # Output: Adult

# 3.4 Operators and Expressions
"""
Python supports arithmetic (+, -, *, /, //, **), comparison (==, >, <), 
and logical operators (and, or, not).
"""
x = 10
y = 3
print(x + y)      # Output: 13
print(x ** y)     # Output: 1000
print(x > y and y > 0)  # Output: True

# ===========================================================
# Section 4: Comments in Python
# ===========================================================

# 4.1 Single-Line Comments
# Use the '#' symbol for single-line comments.
# This is a single-line comment explaining the following code:
name = "Python"

# 4.2 Multi-Line Comments
"""
Use triple quotes of (' or ") for multi-line comments.
These are ideal for longer explanations or documentation.
"""
'''
This is a multi-line comment.
It spans multiple lines.
'''

# 4.3 Docstrings
"""
Docstrings are a type of multi-line comment used to document functions,
classes, or modules. They are enclosed in triple quotes.
"""
def add_numbers(a, b):
    """
    This function takes two arguments and returns their sum.
    Parameters:
        a (int or float): First number.
        b (int or float): Second number.
    Returns:
        int or float: Sum of a and b.
    """
    return a + b

# Calling the function
result = add_numbers(5, 10)
print(result)  # Output: 15

# 4.4 Commenting Best Practices
"""
- Keep comments concise and relevant.
- Avoid obvious comments (e.g., # Adding 1 to x for x += 1).
- Update comments when code changes.
"""

# ===========================================================
# End of Python Tutorial
# ===========================================================

"""
Thank you for exploring Python with this tutorial! Practice the examples and
experiment with the code to deepen your understanding.
"""