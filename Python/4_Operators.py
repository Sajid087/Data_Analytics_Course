"""
===========================================================
Python Tutorial: Operators in Python
===========================================================

This tutorial covers all major operator categories in Python:
1. Arithmetic Operators
2. Comparison Operators
3. Logical Operators
4. Assignment Operators
5. Identity Operators
6. Membership Operators
7. Bitwise Operators

Each section contains explanations, examples, and common pitfalls.
"""

# ===========================================================
# Section 1: Arithmetic Operators
# ===========================================================

"""
Arithmetic operators perform mathematical operations:
+   : Addition
-   : Subtraction
*   : Multiplication
/   : Division (returns a float result)
//  : Floor Division (returns an integer result)
%   : Modulus (remainder)
**  : Exponentiation
"""

# Examples of Arithmetic Operators
a = 15
b = 4

# Basic arithmetic operations
print("Addition:", a + b)       # Output: 19
print("Subtraction:", a - b)    # Output: 11
print("Multiplication:", a * b) # Output: 60
print("Division:", a / b)       # Output: 3.75
print("Floor Division:", a // b)  # Output: 3
print("Modulus:", a % b)        # Output: 3
print("Exponentiation:", a ** b) # Output: 50625

# Common pitfall: Division by zero
try:
    print(a / 0)
except ZeroDivisionError:
    print("Error: Division by zero is not allowed.")

# Best practices:
# - Use `//` for integer division when precision is not needed.
# - Avoid deep exponentiation for very large numbers as it may cause memory errors.

# ===========================================================
# Section 2: Comparison Operators
# ===========================================================

"""
Comparison operators are used to compare two values:
==   : Equal to
!=   : Not equal to
>    : Greater than
<    : Less than
>=   : Greater than or equal to
<=   : Less than or equal to
"""

# Examples of Comparison Operators
x = 10
y = 20

print("x == y:", x == y)  # Output: False
print("x != y:", x != y)  # Output: True
print("x > y:", x > y)    # Output: False
print("x < y:", x < y)    # Output: True
print("x >= y:", x >= y)  # Output: False
print("x <= y:", x <= y)  # Output: True

# Common pitfall:
# - Comparing incompatible types may raise a TypeError (e.g., `x == "10"`).

# ===========================================================
# Section 3: Logical Operators
# ===========================================================

"""
Logical operators are used to combine conditional statements:
and : Returns True if both conditions are True.
or  : Returns True if at least one condition is True.
not : Reverses the boolean value.
"""

# Examples of Logical Operators
a = True
b = False

print("a and b:", a and b)  # Output: False
print("a or b:", a or b)    # Output: True
print("not a:", not a)      # Output: False

# Practical use case
x = 5
y = 10
print("x < 10 and y > 5:", x < 10 and y > 5)  # Output: True

# ===========================================================
# Section 4: Assignment Operators
# ===========================================================

"""
Assignment operators are used to assign values to variables:
=   : Assigns a value.
+=  : Adds and assigns.
-=  : Subtracts and assigns.
*=  : Multiplies and assigns.
/=  : Divides and assigns.
//= : Floor divides and assigns.
%=  : Calculates modulus and assigns.
**= : Raises to power and assigns.
"""

# Examples of Assignment Operators
x = 10
print("Initial value of x:", x)  # Output: 10

x += 5
print("x after x += 5:", x)  # Output: 15

x *= 2
print("x after x *= 2:", x)  # Output: 30

x //= 3
print("x after x //= 3:", x)  # Output: 10

# Common pitfall:
# - Ensure variable initialization before using compound assignment.

# ===========================================================
# Section 5: Identity Operators
# ===========================================================

"""
Identity operators are used to compare the memory location of two objects:
is      : Returns True if both variables reference the same object.
is not  : Returns True if both variables reference different objects.
"""

# Examples of Identity Operators
a = [1, 2, 3]
b = a
c = [1, 2, 3]

print("a is b:", a is b)    # Output: True (same object)
print("a is c:", a is c)    # Output: False (different objects)
print("a is not c:", a is not c)  # Output: True

# Best practice:
# - Use `==` to compare values and `is` to compare object identity.

# ===========================================================
# Section 6: Membership Operators
# ===========================================================

"""
Membership operators check for membership in a sequence (e.g., list, string, tuple):
in      : Returns True if the value is present.
not in  : Returns True if the value is not present.
"""

# Examples of Membership Operators
my_list = [1, 2, 3, 4, 5]

print("3 in my_list:", 3 in my_list)       # Output: True
print("6 not in my_list:", 6 not in my_list)  # Output: True

# Practical use case:
text = "Python programming"
print("'Python' in text:", "Python" in text)  # Output: True

# ===========================================================
# Section 7: Bitwise Operators
# ===========================================================

"""
Bitwise operators perform operations on bits:
&   : AND
|   : OR
^   : XOR
~   : NOT
<<  : Left shift
>>  : Right shift
"""

# Examples of Bitwise Operators
x = 10  # Binary: 1010
y = 4   # Binary: 0100

print("x & y:", x & y)  # Output: 0 (Binary: 0000)
print("x | y:", x | y)  # Output: 14 (Binary: 1110)
print("x ^ y:", x ^ y)  # Output: 14 (Binary: 1110)
print("~x:", ~x)        # Output: -11 (inverted bits)
print("x << 2:", x << 2)  # Output: 40 (Binary: 101000)
print("x >> 2:", x >> 2)  # Output: 2 (Binary: 0010)

# Best practices:
# - Use bitwise operators for low-level programming tasks like masks or flags.

"""
===========================================================
End of Python Operators Tutorial
===========================================================
"""
