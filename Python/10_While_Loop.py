"""
===========================================================
Python Tutorial: The while Loop
===========================================================

This tutorial covers:
1. What a while loop is and its basic syntax
2. When to use while loops vs. for loops
3. Common use cases and best practices
4. Infinite loops and how to avoid them
5. Break and continue statements
6. Practical examples:
   - Basic while loop with a counter
   - While loop with user input
   - While loop with break statement
   - While loop with continue statement
   - Nested while loops
"""

# ===========================================================
# Section 1: Introduction to while Loops
# ===========================================================

"""
The `while` loop in Python is used to repeatedly execute a block of code as long as a specified condition is true.

Syntax:
while condition:
    # Code block to execute

Key Points:
1. The condition is checked before each iteration.
2. Use while loops when the number of iterations is not known beforehand.
3. Be cautious to avoid infinite loops by ensuring the condition will eventually become False.
4. Use `break` to exit a loop prematurely and `continue` to skip to the next iteration.
5. For loops are generally preferred when iterating over a sequence (e.g., lists, ranges), while while loops are better for indefinite iterations.
"""

# ===========================================================
# Section 2: Basic while Loop with a Counter
# ===========================================================

# Example: A simple while loop with a counter
counter = 1  # Initialize counter
while counter <= 5:  # Loop until counter exceeds 5
    print(f"Counter: {counter}")  # Output: Counter: 1, Counter: 2, ..., Counter: 5
    counter += 1  # Increment counter

# ===========================================================
# Section 3: While Loop with User Input
# ===========================================================

"""
While loops are often used to repeatedly prompt users for input until a valid condition is met.
"""

# Example: User input validation
password = ""
while password != "python123":  # Keep looping until the correct password is entered
    password = input("Enter the password: ")
    if password == "python123":
        print("Access granted!")  # Output: Access granted (when input is correct)
    else:
        print("Incorrect password. Try again.")  # Repeats until correct password is entered

# ===========================================================
# Section 4: While Loop with break Statement
# ===========================================================

"""
The `break` statement is used to exit the loop immediately, even if the condition is still True.
"""

# Example: Breaking out of a loop
num = 0
while num < 10:
    print(f"Number: {num}")  # Output: Number: 0, Number: 1, ..., Number: 4
    if num == 5:
        print("Breaking the loop.")
        break  # Exit the loop when num reaches 5
    num += 1

# ===========================================================
# Section 5: While Loop with continue Statement
# ===========================================================

"""
The `continue` statement is used to skip the rest of the loop's code for the current iteration and move to the next iteration.
"""

# Example: Skipping even numbers
num = 0
while num < 10:
    num += 1
    if num % 2 == 0:
        continue  # Skip the print statement for even numbers
    print(f"Odd Number: {num}")  # Output: 1, 3, 5, 7, 9

# ===========================================================
# Section 6: Nested while Loops
# ===========================================================

"""
Nested while loops are loops within loops. Use them for problems requiring multiple levels of iteration.
"""

# Example: Printing a multiplication table
row = 1
while row <= 3:  # Outer loop for rows
    col = 1
    while col <= 3:  # Inner loop for columns
        print(f"{row} x {col} = {row * col}", end="\t")  # Output: Multiplication table
        col += 1
    print()  # New line after each row
    row += 1

# ===========================================================
# Section 7: Infinite Loops and How to Avoid Them
# ===========================================================

"""
An infinite loop occurs when the loop's condition never evaluates to False. To avoid infinite loops:
1. Ensure the condition will eventually become False.
2. Use break statements to provide an escape condition.
"""

# Example: Infinite loop with a break condition
count = 0
while True:  # Infinite loop
    print(f"Count: {count}")
    count += 1
    if count == 5:  # Exit condition
        print("Exiting infinite loop.")
        break  # Avoid infinite loop

# ===========================================================
# Section 8: Common Pitfalls and Best Practices
# ===========================================================

"""
Common Pitfalls:
1. Forgetting to update the loop condition, leading to infinite loops.
2. Using while loops for cases where a for loop would be simpler.
3. Not handling user input properly, causing unexpected behavior.

Best Practices:
1. Ensure the loop condition will eventually become False.
2. Use break and continue wisely to improve readability.
3. Keep while loop blocks concise and focused.
"""

# Example: Pitfall - Forgetting to update the condition
# Uncomment the following lines to test an infinite loop (use Ctrl+C to stop execution)
# num = 1
# while num < 5:
#     print("This is an infinite loop!")  # No update to num, so the condition remains True

# ===========================================================
# End of Python while Loop Tutorial
# ===========================================================
"""
This tutorial demonstrates the power and flexibility of while loops in Python, 
providing clear examples and best practices to help you write efficient and bug-free code.
"""