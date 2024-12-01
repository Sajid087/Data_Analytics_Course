"""
===========================================================
Python Tutorial: if-else Statements
===========================================================

This tutorial covers:
1. Basic syntax and purpose of if-else statements
2. Multiple examples demonstrating:
   - Simple if-else
   - if-elif-else chains
   - Nested if-else
   - Using logical operators (and, or, not)
   - Using comparison operators
3. Real-world use cases with practical examples
4. Common pitfalls and best practices
5. Error handling scenarios

Each concept is explained with examples, comments, and expected output.
"""

# ===========================================================
# Section 1: Basic Syntax of if-else Statements
# ===========================================================

"""
The `if` statement in Python allows you to execute a block of code if a specified condition is true. 
- Use the `else` clause to define code that runs if the condition is false.
Syntax:
if condition:
    # Code block to execute if condition is true
else:
    # Code block to execute if condition is false
"""

# Example: Simple if-else
age = 18
if age >= 18:
    print("You are an adult.")  # Output: You are an adult.
else:
    print("You are a minor.")  # This won't execute since age >= 18.

# ===========================================================
# Section 2: if-elif-else Chains
# ===========================================================

"""
The `if-elif-else` chain is used when multiple conditions need to be checked.
Syntax:
if condition1:
    # Code block for condition1
elif condition2:
    # Code block for condition2
else:
    # Code block if none of the conditions are true
"""

# Example: if-elif-else
marks = 85
if marks >= 90:
    print("Grade: A")  # Output: Grade: B
elif marks >= 80:
    print("Grade: B")
elif marks >= 70:
    print("Grade: C")
else:
    print("Grade: F")

# ===========================================================
# Section 3: Nested if-else Statements
# ===========================================================

"""
Nested if-else statements are if-else blocks inside other if-else blocks. 
They help check complex, dependent conditions.
"""

# Example: Nested if-else
num = 15
if num > 0:
    if num % 2 == 0:
        print(f"{num} is a positive even number.")  # Output: 15 is a positive odd number.
    else:
        print(f"{num} is a positive odd number.")
else:
    print(f"{num} is not a positive number.")

# ===========================================================
# Section 4: Using Logical Operators (and, or, not)
# ===========================================================

"""
Logical operators combine multiple conditions:
- `and`: True if all conditions are true.
- `or`: True if at least one condition is true.
- `not`: Reverses the truth value of a condition.
"""

# Example: Using logical operators
temperature = 30
is_raining = False

if temperature > 20 and not is_raining:
    print("It's a great day for a picnic!")  # Output: It's a great day for a picnic!

# ===========================================================
# Section 5: Using Comparison Operators
# ===========================================================

"""
Comparison operators are used to compare values:
- == (equal), != (not equal)
- > (greater than), < (less than)
- >= (greater than or equal to), <= (less than or equal to)
"""

# Example: Comparison operators
x, y = 10, 20
if x < y:
    print(f"{x} is less than {y}.")  # Output: 10 is less than 20.

# ===========================================================
# Section 6: Real-World Use Cases
# ===========================================================

"""
if-else statements are commonly used in decision-making, such as:
- Checking user input
- Validating data
- Controlling program flow
"""

# Example: Checking user input
password = "secure123"
entered_password = "secure123"

if entered_password == password:
    print("Access granted.")  # Output: Access granted.
else:
    print("Access denied.")

# Example: Validating data
income = 50000
if income > 100000:
    tax_rate = 0.3
elif income > 50000:
    tax_rate = 0.2
else:
    tax_rate = 0.1
print(f"Your tax rate is {tax_rate * 100}%.")  # Output: Your tax rate is 10.0%.

# ===========================================================
# Section 7: Common Pitfalls and Best Practices
# ===========================================================

"""
Common Pitfalls:
1. Using `=` instead of `==` for comparison.
2. Forgetting to use proper indentation.
3. Overcomplicating conditions instead of breaking them into smaller checks.

Best Practices:
1. Write clear and readable conditions.
2. Avoid deep nesting by using elif where possible.
3. Use constants or enums for fixed values to improve readability.
"""

# Example: Pitfall - Using = instead of ==
x = 5
if x == 5:  # Correct: Use '==' for comparison.
    print("x is 5.")  # Output: x is 5.

# ===========================================================
# Section 8: Error Handling Scenarios
# ===========================================================

"""
Use try-except blocks with if-else to handle errors gracefully.
"""

# Example: Error handling in user input
try:
    age = int(input("Enter your age: "))
    if age >= 18:
        print("You are eligible to vote.")  # Output depends on user input.
    else:
        print("You are not eligible to vote.")
except ValueError:
    print("Invalid input! Please enter a numeric value.")  # Output: If input is non-numeric.

# ===========================================================
# Section 9: Single-Line if Statements
# ===========================================================

"""
Python allows single-line if statements for simple conditions:
Syntax: <statement> if <condition> else <statement>
"""

# Example: Single-line if statement
is_sunny = True
activity = "Go outside!" if is_sunny else "Stay indoors."
print(activity)  # Output: Go outside!

"""
===========================================================
End of Python if-else Tutorial
===========================================================
"""