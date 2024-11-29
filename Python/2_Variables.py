"""
===========================================================
Python Tutorial: Variables
===========================================================

This tutorial explains variables in Python with detailed
examples, best practices, and common pitfalls to avoid.
"""

# ===========================================================
# Section 1: Basic Variable Concepts
# ===========================================================

# 1.1 What are Variables?
"""
A variable is a named container used to store data in memory.
It allows programmers to reference and manipulate data easily.
"""
x = 10  # Variable x holds the value 10
print(x)  # Output: 10

# 1.2 Different Data Types
"""
Python supports various data types, including:
- int: Integer numbers (e.g., 1, -10)
- float: Floating-point numbers (e.g., 3.14, -2.5)
- str: Strings, or sequences of characters (e.g., "Hello")
- bool: Boolean values (True, False)
"""
integer_var = 42        # int
float_var = 3.14159     # float
string_var = "Python"   # str
boolean_var = True      # bool

# Display variable types
print(type(integer_var))  # Output: <class 'int'>
print(type(float_var))    # Output: <class 'float'>
print(type(string_var))   # Output: <class 'str'>
print(type(boolean_var))  # Output: <class 'bool'>

# 1.3 Dynamic Typing in Python
"""
Python is dynamically typed, meaning you don't need to declare
a variable's type explicitly. Its type can change during runtime.
"""
dynamic_var = 10          # Initially an integer
print(dynamic_var)        # Output: 10
dynamic_var = "Dynamic!"  # Now a string
print(dynamic_var)        # Output: Dynamic!

# 1.4 Memory Allocation Basics
"""
Variables in Python point to objects in memory. The `id()` 
function shows the memory address of the object a variable references.
"""
a = 5
print(id(a))  # Outputs the memory address of the value 5

# ===========================================================
# Section 2: Variable Naming Conventions
# ===========================================================

# 2.1 Valid and Invalid Variable Names
"""
- Valid: Must start with a letter or underscore, followed by letters, digits, or underscores.
- Invalid: Cannot start with a digit or include special characters (!, @, #, etc.).
"""
_valid_var = "Valid"  # Valid
valid123 = "Also valid"  # Valid
# 123invalid = "Invalid"  # Invalid: Cannot start with a digit
# invalid-var = "Invalid"  # Invalid: Hyphens are not allowed

# 2.2 PEP 8 Naming Guidelines
"""
- Use snake_case for variables: e.g., `user_name`, `total_count`
- Be descriptive but concise.
- Avoid single-character names (except for loop counters or math variables).
"""
user_name = "John"  # Good variable name
x = 10  # Acceptable in short contexts, e.g., loops
total_count = 42  # Follows PEP 8

# 2.3 Reserved Keywords
"""
Avoid using Python's reserved keywords (e.g., `if`, `while`, `class`, etc.).
Use the `keyword` module to see all reserved keywords.
"""
import keyword
print(keyword.kwlist)  # Outputs a list of reserved keywords

# 2.4 Best Practices
"""
- Use meaningful names: e.g., `age` instead of `a`.
- Avoid abbreviations unless widely understood.
- Maintain consistency in naming across the codebase.
"""

# ===========================================================
# Section 3: Variable Assignment
# ===========================================================

# 3.1 Single Value Assignment
x = 10
y = "Python"
print(x, y)  # Output: 10 Python

# 3.2 Multiple Variable Assignment
a, b, c = 1, 2, 3  # Assigning multiple variables at once
print(a, b, c)  # Output: 1 2 3

# 3.3 Unpacking Sequences
my_list = [10, 20, 30]
x, y, z = my_list  # Unpack list into variables
print(x, y, z)  # Output: 10 20 30

# 3.4 Swapping Variables
x, y = y, x  # Swaps the values of x and y
print(x, y)  # Output: Python 10

# 3.5 Type Conversion
"""
Use type conversion functions like `int()`, `float()`, `str()`, and `bool()`.
"""
num = "42"
converted_num = int(num)  # Converts string to int
print(converted_num, type(converted_num))  # Output: 42 <class 'int'>

# ===========================================================
# Section 4: Global vs Local Variables
# ===========================================================

# 4.1 Scope Explanation
"""
- Global variables: Declared outside functions, accessible everywhere.
- Local variables: Declared inside a function, accessible only within that function.
"""
global_var = "I am global"  # Global variable

def my_function():
    local_var = "I am local"  # Local variable
    print(local_var)

my_function()  # Output: I am local
# print(local_var)  # Error: local_var is not defined

# 4.2 Using the `global` Keyword
"""
The `global` keyword allows modifying global variables inside a function.
"""
counter = 0  # Global variable

def increment_counter():
    global counter
    counter += 1

increment_counter()
print(counter)  # Output: 1

# 4.3 Variable Lifetime
"""
Global variables exist throughout the program's execution.
Local variables exist only during the function's execution.
"""

# 4.4 Namespace Concepts
"""
Python maintains namespaces (variable containers):
- Local: Inside functions
- Global: Module-level variables
- Built-in: Python's built-in functions and names
"""
print(globals())  # Prints global namespace
print(locals())   # Prints local namespace

# 4.5 Best Practices for Scope
"""
- Minimize the use of global variables; prefer local variables.
- Use descriptive names to avoid conflicts between scopes.
- Avoid modifying globals unnecessarily.
"""

# ===========================================================
# End of Python Variables Tutorial
# ===========================================================

"""
This tutorial covered variables in Python, including basic concepts, 
naming conventions, assignment methods, and scope. Practice the 
examples and experiment with your own code to master variables!
"""
