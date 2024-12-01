"""
===========================================================
Python Tutorial: The for Loop
===========================================================

This tutorial covers:
1. Basic for loop syntax and structure
2. Iterating through different data types (lists, tuples, strings, dictionaries)
3. Using the range() function with for loops
4. Nested for loops
5. Loop control statements (break, continue)
6. Common use cases and best practices
7. Performance considerations
"""

# ===========================================================
# Section 1: Basic for Loop Syntax and Structure
# ===========================================================

"""
The `for` loop is used to iterate over a sequence (e.g., list, tuple, string, dictionary).
Syntax:
for variable in sequence:
    # Code block to execute

Key Points:
1. The loop variable takes each value in the sequence one at a time.
2. The loop executes once for each element in the sequence.
3. Indentation is critical for defining the loop body.
"""

# Example: Basic for loop iterating through a list
numbers = [1, 2, 3, 4, 5]
for num in numbers:
    print(f"Current number: {num}")  # Output: 1, 2, 3, 4, 5

print()  # Line break for readability

# ===========================================================
# Section 2: Iterating Through Different Data Types
# ===========================================================

# Iterating through a tuple
fruits = ("apple", "banana", "cherry")
for fruit in fruits:
    print(f"Fruit: {fruit}")  # Output: apple, banana, cherry

print()  # Line break for readability

# Iterating through a string (character by character)
word = "Python"
for char in word:
    print(f"Character: {char}")  # Output: P, y, t, h, o, n

print()  # Line break for readability

# Iterating through a dictionary
student = {"name": "John", "age": 20, "grade": "A"}
for key, value in student.items():
    print(f"{key}: {value}")  # Output: name: John, age: 20, grade: A

print()  # Line break for readability

# ===========================================================
# Section 3: Using range() Function with for Loops
# ===========================================================

"""
The `range()` function generates a sequence of numbers.
Syntax:
range(start, stop, step)

1. start: Optional; default is 0.
2. stop: Required; the loop stops before this value.
3. step: Optional; default is 1.
"""

# Example: Looping through a range of numbers
for i in range(5):  # Equivalent to range(0, 5)
    print(f"Value: {i}")  # Output: 0, 1, 2, 3, 4

print()  # Line break for readability

# Example: Using range with a step
for i in range(0, 10, 2):  # Iterates through even numbers
    print(f"Even number: {i}")  # Output: 0, 2, 4, 6, 8

print()  # Line break for readability

# ===========================================================
# Section 4: Nested for Loops
# ===========================================================

"""
Nested for loops are loops inside other loops.
They are useful for working with multi-dimensional data (e.g., matrices).
"""

# Example: Nested for loop to print a multiplication table
for i in range(1, 4):  # Outer loop
    for j in range(1, 4):  # Inner loop
        print(f"{i} x {j} = {i * j}", end="\t")  # Output: Multiplication table
    print()  # New line after each row

print()  # Line break for readability

# ===========================================================
# Section 5: Loop Control Statements (break, continue)
# ===========================================================

"""
1. `break`: Exits the loop prematurely.
2. `continue`: Skips the rest of the loop body for the current iteration.
"""

# Example: Using break
for num in range(1, 10):
    if num == 5:
        print("Breaking the loop.")
        break  # Exit the loop when num is 5
    print(f"Number: {num}")  # Output: 1, 2, 3, 4

print()  # Line break for readability

# Example: Using continue
for num in range(1, 6):
    if num == 3:
        print("Skipping 3.")
        continue  # Skip the rest of the loop body for this iteration
    print(f"Number: {num}")  # Output: 1, 2, 4, 5

print()  # Line break for readability

# ===========================================================
# Section 6: Common Use Cases and Best Practices
# ===========================================================

"""
Use Cases:
1. Processing elements in a collection (e.g., lists, tuples, dictionaries).
2. Generating sequences of numbers (using range()).
3. Implementing algorithms (e.g., searching, sorting).

Best Practices:
1. Use descriptive variable names for the loop variable.
2. Avoid modifying the sequence inside the loop.
3. Prefer list comprehensions for concise operations.
"""

# Example: List comprehension to square numbers
numbers = [1, 2, 3, 4, 5]
squares = [num ** 2 for num in numbers]
print(f"Squares: {squares}")  # Output: [1, 4, 9, 16, 25]

print()  # Line break for readability

# ===========================================================
# Section 7: Performance Considerations
# ===========================================================

"""
For loops are generally efficient, but:
1. Avoid unnecessary nested loops for large datasets.
2. Use built-in functions (e.g., sum(), max()) for optimized performance.
3. Consider using NumPy for numerical operations on large arrays.
"""

# Example: Using sum() for better performance
numbers = list(range(1, 1000001))
total = sum(numbers)  # Efficient computation of the sum
print(f"Sum of first 1,000,000 numbers: {total}")

# ===========================================================
# End of Python for Loop Tutorial
# ===========================================================
"""
This tutorial demonstrates the versatility of the `for` loop in Python, providing examples, best practices, and tips to write efficient and readable code.
"""