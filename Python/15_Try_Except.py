"""
===============================================================
Python Tutorial: Try-Except Error Handling Mechanism
===============================================================

This tutorial covers the following topics:
1. Basic try-except syntax and purpose
2. Common exception types (ValueError, TypeError, ZeroDivisionError)
3. Multiple except blocks
4. Using else and finally clauses
5. Custom exception handling
6. Best practices for error handling

Error handling is an essential part of robust programming. The try-except
mechanism allows you to gracefully manage and respond to runtime errors
without crashing the program.
"""

# ================================================================
# 1. Basic Try-Except Syntax and Purpose
# ================================================================

"""
The try-except block is used to catch and handle exceptions. Code that may
raise an exception is placed inside the `try` block. If an error occurs,
the code in the `except` block is executed.
"""

# Example: Handling a division by zero error
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Error: Division by zero is not allowed.")  # Output: Error: Division by zero is not allowed.

print("Program continues after handling the exception.\n")  # Demonstrates program flow.

# ================================================================
# 2. Common Exception Types
# ================================================================

"""
Common exceptions in Python include:
- ValueError: Raised when a function receives an argument of the correct type but inappropriate value.
- TypeError: Raised when an operation is performed on an inappropriate type.
- ZeroDivisionError: Raised when dividing by zero.
"""

# Example: ValueError
try:
    number = int("abc")  # Invalid conversion
except ValueError as e:
    print(f"ValueError: {e}")  # Output: ValueError: invalid literal for int() with base 10: 'abc'

# Example: TypeError
try:
    result = "text" + 10  # Adding string and integer
except TypeError as e:
    print(f"TypeError: {e}")  # Output: TypeError: can only concatenate str (not "int") to str

# Example: ZeroDivisionError
try:
    result = 1 / 0
except ZeroDivisionError as e:
    print(f"ZeroDivisionError: {e}")  # Output: ZeroDivisionError: division by zero

print()

# ================================================================
# 3. Multiple Except Blocks
# ================================================================

"""
You can handle different exception types with separate except blocks.
Python executes the first matching block it encounters.
"""

# Example: Handling multiple exceptions
try:
    value = int(input("Enter a number: "))  # Try entering "abc" or leave blank
    result = 100 / value  # Try entering 0
except ValueError:
    print("Error: Input must be a valid number.")
except ZeroDivisionError:
    print("Error: Cannot divide by zero.")
else:
    print(f"Result: {result}")  # Executes only if no exceptions occur.

print()

# ================================================================
# 4. Using Else and Finally Clauses
# ================================================================

"""
- The `else` block executes if no exceptions are raised in the try block.
- The `finally` block executes regardless of whether an exception occurs,
  often used for cleanup operations.
"""

# Example: Using else and finally
try:
    value = int(input("Enter a number greater than zero: "))
    result = 100 / value
except ValueError:
    print("Error: Input must be a valid number.")
except ZeroDivisionError:
    print("Error: Cannot divide by zero.")
else:
    print(f"Result: {result}")  # Executes if no exceptions occur.
finally:
    print("Execution of finally block. Always runs.")  # Always executes.

print()

# ================================================================
# 5. Custom Exception Handling
# ================================================================

"""
You can define custom exceptions by creating a new class that inherits
from the built-in Exception class.
"""

# Example: Custom exception for invalid age
class InvalidAgeError(Exception):
    """Custom exception for invalid age."""
    pass

def check_age(age):
    if age < 0:
        raise InvalidAgeError("Age cannot be negative.")
    elif age < 18:
        print("Minor: Access restricted.")
    else:
        print("Adult: Access granted.")

try:
    age = int(input("Enter your age: "))  # Try entering -5 or 17
    check_age(age)
except InvalidAgeError as e:
    print(f"InvalidAgeError: {e}")
except ValueError:
    print("Error: Age must be a valid number.")

print()

# ================================================================
# 6. Best Practices for Error Handling
# ================================================================

"""
Best practices for using try-except:
1. Catch specific exceptions rather than using a bare except block.
2. Use the else block for code that should run only if no exceptions occur.
3. Always use finally for cleanup operations (e.g., closing files).
4. Avoid overusing try-except for control flow.
5. Log errors for debugging instead of suppressing them silently.
6. Keep try-except blocks small to make debugging easier.
"""

# Example: Demonstrating file handling with try-except-finally
try:
    file = open("example.txt", "r")  # Replace with a non-existent file to simulate an error
    content = file.read()
    print(content)
except FileNotFoundError:
    print("Error: The file was not found.")
finally:
    if 'file' in locals() and not file.closed:
        file.close()
        print("File closed.")

# Common pitfall: Bare except block suppresses all exceptions (avoid this)
try:
    print(1 / 0)  # Division by zero
except:
    print("An error occurred.")  # Suppresses useful details about the error (not recommended)

print("\nEnd of tutorial.")