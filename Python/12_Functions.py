"""
===========================================================
Python Tutorial: Functions
===========================================================

This tutorial covers:
1. What Python functions are, their purpose, and importance.
2. Examples of:
   - Basic function definition and syntax.
   - Functions with parameters (required, optional, default values).
   - Return statements and multiple returns.
   - Lambda functions.
   - *args and **kwargs usage.
   - Function scope and variable visibility.
   - Recursive functions.
   - Function documentation (docstrings).
   - Function annotations (type hints).
3. Real-world use cases, best practices, and common pitfalls.
"""

# ===========================================================
# Section 1: What Are Functions?
# ===========================================================

"""
Functions are reusable blocks of code that perform a specific task. 
They help in organizing code, reducing redundancy, and improving readability.
Syntax:
def function_name(parameters):
    # Code block
    return [optional return value]

Key Points:
1. Functions can take input (parameters) and produce output (return value).
2. Functions help modularize and organize code logically.
3. Python has both user-defined and built-in functions.
"""

# ===========================================================
# Section 2: Basic Function Definition and Syntax
# ===========================================================

# Example: Basic function to greet a user
def greet():
    """This function prints a greeting message."""
    print("Hello! Welcome to the Python tutorial.")

# Call the function
greet()  # Output: Hello! Welcome to the Python tutorial.

print()  # Line break for readability

# ===========================================================
# Section 3: Functions with Parameters
# ===========================================================

# Required Parameters
def greet_user(name):
    """Greets a user by their name."""
    print(f"Hello, {name}!")

greet_user("Alice")  # Output: Hello, Alice!

# Default Parameters
def greet_with_default(name="Guest"):
    """Greets a user with a default name if none is provided."""
    print(f"Hello, {name}!")

greet_with_default()       # Output: Hello, Guest!
greet_with_default("Bob")  # Output: Hello, Bob!

# Multiple Parameters
def add_numbers(a, b):
    """Adds two numbers and returns the result."""
    return a + b

result = add_numbers(10, 5)
print(f"Sum: {result}")  # Output: Sum: 15

print()  # Line break for readability

# ===========================================================
# Section 4: Return Statements and Multiple Returns
# ===========================================================

# Example: Function with a single return value
def square(number):
    """Returns the square of a number."""
    return number ** 2

print(f"Square of 4: {square(4)}")  # Output: Square of 4: 16

# Example: Function with multiple return values
def calculate_area_and_perimeter(length, width):
    """Returns both area and perimeter of a rectangle."""
    area = length * width
    perimeter = 2 * (length + width)
    return area, perimeter

area, perimeter = calculate_area_and_perimeter(5, 3)
print(f"Area: {area}, Perimeter: {perimeter}")  # Output: Area: 15, Perimeter: 16

print()  # Line break for readability

# ===========================================================
# Section 5: Lambda Functions
# ===========================================================

"""
Lambda functions are anonymous functions defined using the `lambda` keyword.
They are useful for short, one-liner functions.
Syntax:
lambda arguments: expression
"""

# Example: Lambda function to calculate the square of a number
square_lambda = lambda x: x ** 2
print(f"Square using lambda: {square_lambda(5)}")  # Output: Square using lambda: 25

# Example: Lambda function with multiple arguments
add = lambda x, y: x + y
print(f"Addition using lambda: {add(3, 7)}")  # Output: Addition using lambda: 10

print()  # Line break for readability

# ===========================================================
# Section 6: *args and **kwargs
# ===========================================================

"""
1. `*args`: Allows passing a variable number of positional arguments.
2. `**kwargs`: Allows passing a variable number of keyword arguments.
"""

# Example: Using *args
def sum_numbers(*args):
    """Calculates the sum of all numbers passed as arguments."""
    return sum(args)

print(f"Sum using *args: {sum_numbers(1, 2, 3, 4, 5)}")  # Output: Sum using *args: 15

# Example: Using **kwargs
def print_user_info(**kwargs):
    """Prints user information from keyword arguments."""
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_user_info(name="Alice", age=30, city="New York")
# Output:
# name: Alice
# age: 30
# city: New York

print()  # Line break for readability

# ===========================================================
# Section 7: Function Scope and Variable Visibility
# ===========================================================

"""
1. Variables defined inside a function are local to that function.
2. Use the `global` keyword to modify global variables inside a function.
"""

# Example: Local and global scope
x = 10  # Global variable

def modify_variable():
    global x
    x = 20  # Modify the global variable

modify_variable()
print(f"Global variable after modification: {x}")  # Output: Global variable after modification: 20

print()  # Line break for readability

# ===========================================================
# Section 8: Recursive Functions
# ===========================================================

"""
A recursive function calls itself. Use it for problems like factorial, Fibonacci, etc.
"""

# Example: Recursive function to calculate factorial
def factorial(n):
    """Returns the factorial of a number."""
    if n == 1:
        return 1
    return n * factorial(n - 1)

print(f"Factorial of 5: {factorial(5)}")  # Output: Factorial of 5: 120

print()  # Line break for readability

# ===========================================================
# Section 9: Function Documentation (Docstrings)
# ===========================================================

"""
Docstrings are used to document what a function does.
They are written as the first statement in the function body using triple quotes.
"""

def example_function(param):
    """
    This is an example function.
    Args:
        param: Description of the parameter.
    Returns:
        Description of the return value.
    """
    return param

# Accessing a docstring
print(example_function.__doc__)

print()  # Line break for readability

# ===========================================================
# Section 10: Function Annotations (Type Hints)
# ===========================================================

"""
Function annotations provide type hints for function arguments and return values.
Syntax:
def function_name(arg1: type, arg2: type) -> return_type:
"""

# Example: Using type hints
def multiply(a: int, b: int) -> int:
    """Multiplies two integers and returns the result."""
    return a * b

print(f"Multiplication with type hints: {multiply(3, 7)}")  # Output: Multiplication with type hints: 21

# ===========================================================
# End of Python Functions Tutorial
# ===========================================================
"""
This tutorial covers the essential concepts of Python functions with examples.
Practice creating and using functions in your projects to understand their versatility.
"""