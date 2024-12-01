"""
===========================================================
Python Tutorial: Lists in Python
===========================================================

This tutorial covers the following topics:
1. What Python Lists are and their key characteristics
2. How Lists differ from other data structures
3. Common List operations and methods
4. List slicing and indexing
5. List comprehension
6. Memory management with Lists

Each section includes detailed explanations and practical examples.
"""

# ===========================================================
# Section 1: What Python Lists Are and Their Characteristics
# ===========================================================

"""
Lists are mutable, ordered collections of items in Python. They can store
heterogeneous data types (e.g., integers, strings, floats) and are dynamic,
allowing elements to be added or removed at runtime.
"""

# Example: Creating and printing a list
my_list = [1, "Python", 3.14, True]
print("Example List:", my_list)  # Output: [1, 'Python', 3.14, True]

# Characteristics of Lists:
# - Ordered: Elements maintain the order of insertion.
# - Mutable: Elements can be modified after creation.
# - Allow duplicates: Lists can store duplicate values.

# ===========================================================
# Section 2: How Lists Differ from Other Data Structures
# ===========================================================

"""
Lists vs Tuples:
- Lists are mutable, whereas tuples are immutable.
- Lists use more memory than tuples due to mutability overhead.

Lists vs Sets:
- Lists allow duplicate values, while sets do not.
- Lists are ordered; sets are unordered.

Lists vs Dictionaries:
- Lists store individual elements, while dictionaries store key-value pairs.
"""

# ===========================================================
# Section 3: Common List Operations and Methods
# ===========================================================

"""
Common operations on lists include:
1. Adding elements
2. Removing elements
3. Accessing elements
4. Manipulating elements
"""

# Adding Elements
my_list.append("New Element")  # Adds an element to the end
print("After append:", my_list)  # Output: [1, 'Python', 3.14, True, 'New Element']

my_list.insert(1, "Inserted Element")  # Inserts an element at index 1
print("After insert:", my_list)  # Output: [1, 'Inserted Element', 'Python', 3.14, True, 'New Element']

# Removing Elements
my_list.pop()  # Removes the last element
print("After pop:", my_list)  # Output: [1, 'Inserted Element', 'Python', 3.14, True]

my_list.remove(3.14)  # Removes the first occurrence of the value
print("After remove:", my_list)  # Output: [1, 'Inserted Element', 'Python', True]

# Accessing and Modifying Elements
print("Element at index 2:", my_list[2])  # Output: Python
my_list[2] = "Modified Element"  # Modifies the element at index 2
print("After modification:", my_list)  # Output: [1, 'Inserted Element', 'Modified Element', True]

# ===========================================================
# Section 4: List Slicing and Indexing
# ===========================================================

"""
List indexing allows accessing individual elements, while slicing allows 
retrieving subsets of a list using the syntax list[start:end:step].
"""

# Indexing
example_list = [0, 1, 2, 3, 4, 5]
print("Element at index 3:", example_list[3])  # Output: 3

# Slicing
print("Slice [1:4]:", example_list[1:4])  # Output: [1, 2, 3]
print("Slice with step [::2]:", example_list[::2])  # Output: [0, 2, 4]

# ===========================================================
# Section 5: List Comprehension
# ===========================================================

"""
List comprehension is a concise way to create lists. Syntax:
[new_element for element in iterable if condition]
"""

# Example: Generating a list of squares
squares = [x**2 for x in range(5)]
print("Squares:", squares)  # Output: [0, 1, 4, 9, 16]

# Example: Filtering even numbers
evens = [x for x in range(10) if x % 2 == 0]
print("Even numbers:", evens)  # Output: [0, 2, 4, 6, 8]

# ===========================================================
# Section 6: Memory Management with Lists
# ===========================================================

"""
Lists use dynamic memory allocation to grow or shrink as needed. However, frequent
modifications (e.g., appending or inserting elements) can lead to performance issues.

Tips for optimizing list usage:
1. Use list comprehension for faster list creation.
2. Avoid excessive resizing; preallocate space when possible.
3. Use tuples for read-only data to save memory.
"""

# Example: Checking the memory address of a list
import sys
my_list = [1, 2, 3]
print("Memory size of list:", sys.getsizeof(my_list))  # Output: Memory size in bytes

# ===========================================================
# Practical Examples and Advanced List Usage
# ===========================================================

# Nested Lists
nested_list = [[1, 2], [3, 4], [5, 6]]
print("Accessing nested list element:", nested_list[1][1])  # Output: 4

# Sorting a List
unsorted_list = [5, 2, 9, 1]
unsorted_list.sort()  # Sorts in-place
print("Sorted list:", unsorted_list)  # Output: [1, 2, 5, 9]

# Searching in a List
if 5 in unsorted_list:
    print("5 is in the list.")  # Output: 5 is in the list.

# Common List Methods
example_methods_list = [1, 2, 3]
example_methods_list.extend([4, 5])  # Adds multiple elements
print("After extend:", example_methods_list)  # Output: [1, 2, 3, 4, 5]

example_methods_list.reverse()  # Reverses the list in-place
print("After reverse:", example_methods_list)  # Output: [5, 4, 3, 2, 1]

"""
===========================================================
End of Python Lists Tutorial
===========================================================
"""