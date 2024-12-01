"""
===========================================================
Python Tutorial: Tuples in Python
===========================================================

This tutorial covers the following topics:
1. What Tuples are and their key characteristics
2. How Tuples differ from lists and other data structures
3. Why and when to use Tuples
4. Tuple immutability and its benefits

Additionally, practical examples demonstrate:
- Tuple creation and initialization
- Accessing and slicing Tuple elements
- Tuple methods (count, index)
- Tuple packing and unpacking
- Nested Tuples
- Converting Tuples to other data types and vice versa
- Using Tuples in functions
- Real-world applications of Tuples
"""

# ===========================================================
# Section 1: What Tuples Are and Their Key Characteristics
# ===========================================================

"""
Tuples are immutable, ordered collections of elements in Python.
Key characteristics:
- Tuples are defined using parentheses: ()
- They can store heterogeneous data types.
- They maintain the order of elements.
- Tuples are immutable, meaning their elements cannot be modified after creation.
"""

# Example: Creating Tuples
empty_tuple = ()  # Empty tuple
single_element_tuple = (1,)  # Tuple with a single element (note the comma)
multi_element_tuple = (1, "Python", 3.14)

print("Empty Tuple:", empty_tuple)  # Output: ()
print("Single Element Tuple:", single_element_tuple)  # Output: (1,)
print("Multi-Element Tuple:", multi_element_tuple)  # Output: (1, 'Python', 3.14)

# ===========================================================
# Section 2: How Tuples Differ from Lists and Other Data Structures
# ===========================================================

"""
Tuples vs Lists:
- Tuples are immutable, while lists are mutable.
- Tuples are generally faster than lists due to immutability.
- Tuples use less memory compared to lists.

Tuples vs Sets:
- Tuples are ordered; sets are unordered.
- Tuples allow duplicate elements, whereas sets do not.

Tuples vs Dictionaries:
- Tuples store individual values, whereas dictionaries store key-value pairs.
"""

# ===========================================================
# Section 3: Why and When to Use Tuples
# ===========================================================

"""
Tuples are used when:
- Data should remain constant (e.g., coordinates, configuration settings).
- Memory optimization is important.
- Elements are meant to be iterated over but not modified.
"""

# Example: Using a Tuple to Represent Immutable Data
coordinates = (10.5, 20.3)  # Latitude and Longitude
print("Coordinates:", coordinates)  # Output: (10.5, 20.3)

# ===========================================================
# Section 4: Tuple Immutability and Its Benefits
# ===========================================================

"""
Immutability ensures:
- Tuples are hashable, making them usable as dictionary keys or set elements.
- Data integrity, as elements cannot be modified accidentally.
"""

# Example: Using a Tuple as a Dictionary Key
location_data = {(10.5, 20.3): "Park"}
print("Location Data:", location_data)  # Output: {(10.5, 20.3): 'Park'}

# ===========================================================
# Section 5: Accessing and Slicing Tuple Elements
# ===========================================================

# Accessing Elements
example_tuple = (1, 2, 3, 4, 5)
print("First Element:", example_tuple[0])  # Output: 1
print("Last Element:", example_tuple[-1])  # Output: 5

# Slicing Tuples
print("Slice [1:4]:", example_tuple[1:4])  # Output: (2, 3, 4)

# ===========================================================
# Section 6: Tuple Methods (count, index)
# ===========================================================

"""
Tuples have two primary methods:
- count: Returns the number of occurrences of a value.
- index: Returns the index of the first occurrence of a value.
"""

example_tuple = (1, 2, 3, 2, 4, 2)
print("Count of 2:", example_tuple.count(2))  # Output: 3
print("Index of 3:", example_tuple.index(3))  # Output: 2

# ===========================================================
# Section 7: Tuple Packing and Unpacking
# ===========================================================

"""
Tuple Packing: Assigning multiple values to a single tuple.
Tuple Unpacking: Extracting tuple elements into separate variables.
"""

# Packing
packed_tuple = "Python", 3.9, "Tutorial"
print("Packed Tuple:", packed_tuple)  # Output: ('Python', 3.9, 'Tutorial')

# Unpacking
language, version, topic = packed_tuple
print("Unpacked Elements:", language, version, topic)  # Output: Python 3.9 Tutorial

# ===========================================================
# Section 8: Nested Tuples
# ===========================================================

"""
Tuples can contain other tuples as elements, forming nested tuples.
"""

nested_tuple = (1, (2, 3), (4, (5, 6)))
print("Nested Tuple:", nested_tuple)  # Output: (1, (2, 3), (4, (5, 6)))
print("Accessing Nested Element:", nested_tuple[2][1][1])  # Output: 6

# ===========================================================
# Section 9: Converting Tuples to Other Data Types
# ===========================================================

"""
Tuples can be converted to other data types and vice versa using built-in functions.
"""

# Converting Tuple to List
tuple_to_list = list(example_tuple)
print("Tuple to List:", tuple_to_list)  # Output: [1, 2, 3, 2, 4, 2]

# Converting List to Tuple
list_to_tuple = tuple(tuple_to_list)
print("List to Tuple:", list_to_tuple)  # Output: (1, 2, 3, 2, 4, 2)

# ===========================================================
# Section 10: Using Tuples in Functions
# ===========================================================

"""
Tuples are commonly used in functions:
1. As return values (to return multiple items).
2. As parameters (to accept variable-length arguments).
"""

# Tuple as a Return Value
def get_coordinates():
    return (10.5, 20.3)

coordinates = get_coordinates()
print("Returned Coordinates:", coordinates)  # Output: (10.5, 20.3)

# Tuple as a Function Parameter
def calculate_sum(*args):
    return sum(args)

result = calculate_sum(1, 2, 3, 4, 5)
print("Sum of Tuple Elements:", result)  # Output: 15

# ===========================================================
# Section 11: Real-World Applications of Tuples
# ===========================================================

"""
Tuples are used in:
1. Returning multiple values from a function.
2. Storing constant configurations (e.g., RGB color values).
3. Representing database records or CSV rows.
4. Using as keys in dictionaries.
"""

# Example: Representing RGB Colors
rgb_color = (255, 0, 0)  # Red color
print("RGB Color:", rgb_color)  # Output: (255, 0, 0)

"""
===========================================================
End of Python Tuples Tutorial
===========================================================
"""