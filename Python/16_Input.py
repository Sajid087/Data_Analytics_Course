"""
===============================================================
Python Tutorial: User Input Handling
===============================================================

This tutorial covers the following topics:
1. The `input()` function and its purpose
2. Collecting different data types (strings, integers, floats)
3. Input validation techniques
4. Error handling with try-except blocks
5. Best practices for user prompts
6. Advanced input handling (default values, command-line arguments, stdin)

Each section includes practical examples, real-world use cases, 
and common pitfalls to avoid.
"""

# ================================================================
# 1. The `input()` Function and Its Purpose
# ================================================================

"""
The `input()` function in Python allows the program to take input from the user.
It always returns a string, so type conversion is needed for numeric inputs.
"""

# Example: Basic string input
name = input("Enter your name: ")  # User types "Alice"
print(f"Hello, {name}!")  # Output: Hello, Alice!

# ================================================================
# 2. Collecting Different Data Types
# ================================================================

"""
Since `input()` returns a string, you'll need to convert it to other data types
using functions like `int()`, `float()`, or `bool()`.
"""

# Example: Collecting an integer
try:
    age = int(input("Enter your age: "))  # User types "25"
    print(f"You are {age} years old.")  # Output: You are 25 years old.
except ValueError:
    print("Error: Please enter a valid integer.")

# Example: Collecting a float
try:
    height = float(input("Enter your height in meters: "))  # User types "1.75"
    print(f"Your height is {height} meters.")  # Output: Your height is 1.75 meters.
except ValueError:
    print("Error: Please enter a valid number.")

# Example: Collecting a boolean (via yes/no input)
response = input("Do you like Python? (yes/no): ").strip().lower()  # User types "yes"
likes_python = response == "yes"  # Converts to a boolean
print(f"Likes Python: {likes_python}")  # Output: Likes Python: True

# ================================================================
# 3. Input Validation Techniques
# ================================================================

"""
Input validation ensures that the user provides the expected type or format of data.
Use loops and conditionals to prompt users again for invalid input.
"""

# Example: Validating numeric input within a range
while True:
    try:
        score = int(input("Enter a score between 0 and 100: "))  # User types "105"
        if 0 <= score <= 100:
            print(f"Your score is {score}.")  # Output if valid: Your score is 85.
            break
        else:
            print("Error: Score must be between 0 and 100.")
    except ValueError:
        print("Error: Please enter a valid integer.")

# ================================================================
# 4. Error Handling with Try-Except Blocks
# ================================================================

"""
Use try-except blocks to gracefully handle errors during input conversion.
"""

# Example: Handling invalid input
try:
    number = int(input("Enter a number: "))  # User types "abc"
    print(f"You entered: {number}")
except ValueError:
    print("Error: That was not a valid number.")  # Output: Error: That was not a valid number.

# ================================================================
# 5. Best Practices for User Prompts
# ================================================================

"""
Best Practices:
1. Provide clear instructions in your prompts.
2. Use `strip()` to remove unwanted spaces from user input.
3. Always validate user input, especially for critical operations.
4. Avoid crashing the program due to invalid input.
"""

# Example: Clear and user-friendly prompts
username = input("Please enter your username (alphanumeric only): ").strip()
print(f"Welcome, {username}!")  # Output: Welcome, JohnDoe!

# ================================================================
# 6. Advanced Input Handling
# ================================================================

# ---------------------------------------------------------------
# a) Collecting Multiple Inputs
# ---------------------------------------------------------------

"""
Use `split()` to collect multiple inputs in a single line. Useful for handling
lists or coordinates.
"""

# Example: Collecting multiple numbers
numbers = input("Enter three numbers separated by spaces: ").split()  # User types "10 20 30"
numbers = [int(num) for num in numbers]  # Convert to integers
print(f"You entered: {numbers}")  # Output: You entered: [10, 20, 30]

# ---------------------------------------------------------------
# b) Input with Default Values
# ---------------------------------------------------------------

"""
Provide default values if the user leaves the input blank.
"""

# Example: Default input
age = input("Enter your age (press Enter to skip): ").strip()
age = int(age) if age else 18  # Default age is 18 if no input
print(f"Your age is {age}.")  # Output: Your age is 18.

# ---------------------------------------------------------------
# c) Command-Line Arguments
# ---------------------------------------------------------------

"""
The `sys` module allows you to collect command-line arguments.
"""

import sys

if len(sys.argv) > 1:
    print(f"Command-line arguments: {sys.argv}")  # Output: ['script.py', 'arg1', 'arg2']
else:
    print("No command-line arguments were provided.")

# ---------------------------------------------------------------
# d) Reading from stdin
# ---------------------------------------------------------------

"""
For advanced input handling, you can read directly from stdin. Useful in
batch scripts or competitive programming.
"""

import sys

print("Enter multiple lines (Ctrl+D to finish):")
input_data = sys.stdin.read()  # Reads until EOF
print(f"You entered:\n{input_data}")

# ================================================================
# Common Pitfalls to Avoid
# ================================================================

"""
1. Forgetting to handle empty input (can cause crashes during conversion).
2. Not stripping whitespace from user input.
3. Assuming all input will be valid; always validate.
4. Overusing try-except for control flow instead of proper validation.
"""

# ================================================================
# Performance Considerations
# ================================================================

"""
1. Avoid excessive input prompts in performance-critical applications.
2. For large-scale input handling, use batch processing with stdin or files.
3. Validate input early to prevent unnecessary processing of invalid data.
"""

# ================================================================
# End of Tutorial
# ================================================================

print("Thank you for following this tutorial on user input handling!")