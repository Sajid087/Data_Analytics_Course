"""
===========================================================
Python Tutorial: Dictionaries in Python
===========================================================

This tutorial covers:
1. Basic definition and purpose of dictionaries
2. Dictionary syntax and creation methods
3. Key-value pair concept
4. Common dictionary operations (adding, removing, updating elements)
5. Dictionary methods (keys(), values(), items(), get(), etc.)
6. Nested dictionaries
7. Dictionary comprehension
8. Best practices and common use cases

Each concept is demonstrated with clear examples, comments, and explanations.
"""

# ===========================================================
# Section 1: Basic Definition and Purpose of Dictionaries
# ===========================================================

"""
A dictionary in Python is a collection of key-value pairs, where each key is unique, and each key is associated with a value.
- Keys must be immutable (e.g., strings, numbers, tuples).
- Values can be of any data type.
- Dictionaries are unordered (prior to Python 3.7) but maintain insertion order (from Python 3.7+).
"""

# Example: Creating a dictionary
person = {
    "name": "Alice",
    "age": 25,
    "city": "New York"
}
print("Dictionary:", person)  # Output: {'name': 'Alice', 'age': 25, 'city': 'New York'}

# ===========================================================
# Section 2: Dictionary Syntax and Creation Methods
# ===========================================================

"""
Dictionaries can be created in various ways:
1. Using curly braces {}.
2. Using the dict() constructor.
3. From a list of key-value pairs.
"""

# Example: Different ways to create a dictionary
# Using curly braces
dict1 = {"a": 1, "b": 2, "c": 3}

# Using dict() constructor
dict2 = dict(x=10, y=20, z=30)

# From a list of key-value pairs
dict3 = dict([("name", "Bob"), ("age", 30), ("city", "London")])

print("Dict1:", dict1)  # Output: {'a': 1, 'b': 2, 'c': 3}
print("Dict2:", dict2)  # Output: {'x': 10, 'y': 20, 'z': 30}
print("Dict3:", dict3)  # Output: {'name': 'Bob', 'age': 30, 'city': 'London'}

# ===========================================================
# Section 3: Key-Value Pair Concept
# ===========================================================

"""
A dictionary stores data as key-value pairs:
- Keys must be unique and immutable.
- Values can be duplicated and mutable.
"""

# Example: Accessing dictionary elements
student = {"id": 101, "name": "Emma", "grade": "A"}
print("Student Name:", student["name"])  # Output: Emma

# Attempting to use a mutable key (e.g., a list) raises a TypeError
try:
    invalid_dict = {[1, 2]: "Invalid"}
except TypeError as e:
    print("Error:", e)  # Output: unhashable type: 'list'

# ===========================================================
# Section 4: Common Dictionary Operations
# ===========================================================

"""
Basic dictionary operations:
1. Adding or updating elements.
2. Removing elements (using del, pop()).
3. Checking for keys (using 'in').
"""

# Adding or updating elements
inventory = {"apples": 10, "oranges": 5}
inventory["bananas"] = 15  # Adding a new key-value pair
inventory["apples"] = 20  # Updating an existing key's value
print("Updated Inventory:", inventory)  # Output: {'apples': 20, 'oranges': 5, 'bananas': 15}

# Removing elements
del inventory["oranges"]  # Removes 'oranges'
print("After Deletion:", inventory)  # Output: {'apples': 20, 'bananas': 15}

# Using pop() to remove and retrieve a value
removed_value = inventory.pop("bananas")
print("Removed Value:", removed_value)  # Output: 15
print("Inventory After pop():", inventory)  # Output: {'apples': 20}

# Checking for keys
print("Is 'apples' in inventory?", "apples" in inventory)  # Output: True

# ===========================================================
# Section 5: Dictionary Methods
# ===========================================================

"""
Common dictionary methods include:
- keys(): Returns all keys.
- values(): Returns all values.
- items(): Returns all key-value pairs as tuples.
- get(): Retrieves a value for a key (returns None if key does not exist).
"""

# Example: Using dictionary methods
person = {"name": "John", "age": 28, "city": "Boston"}
print("Keys:", person.keys())  # Output: dict_keys(['name', 'age', 'city'])
print("Values:", person.values())  # Output: dict_values(['John', 28, 'Boston'])
print("Items:", person.items())  # Output: dict_items([('name', 'John'), ('age', 28), ('city', 'Boston')])

# Using get() to avoid KeyError
print("Get 'age':", person.get("age"))  # Output: 28
print("Get 'job':", person.get("job", "Not Found"))  # Output: Not Found

# ===========================================================
# Section 6: Nested Dictionaries
# ===========================================================

"""
Dictionaries can contain other dictionaries as values, creating a nested structure.
"""

# Example: Nested dictionary
company = {
    "sales": {"Alice": 5000, "Bob": 7000},
    "engineering": {"Eve": 8000, "Charlie": 6500}
}

print("Sales Department:", company["sales"])  # Output: {'Alice': 5000, 'Bob': 7000}
print("Eve's Salary:", company["engineering"]["Eve"])  # Output: 8000

# ===========================================================
# Section 7: Dictionary Comprehension
# ===========================================================

"""
Dictionary comprehension allows creating dictionaries in a concise way.
Syntax: {key_expr: value_expr for item in iterable if condition}
"""

# Example: Dictionary comprehension
squared_numbers = {x: x**2 for x in range(1, 6)}
print("Squared Numbers Dictionary:", squared_numbers)  # Output: {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}

# ===========================================================
# Section 8: Best Practices and Common Use Cases
# ===========================================================

"""
Best Practices:
1. Use descriptive and meaningful keys.
2. Use get() to safely access values without KeyError.
3. Use dictionary methods for iteration and manipulation.

Common Use Cases:
1. Storing and accessing data (e.g., student records, inventory).
2. Counting occurrences using a dictionary.
"""

# Example: Counting occurrences with a dictionary
words = ["apple", "banana", "apple", "orange", "banana", "apple"]
word_count = {}
for word in words:
    word_count[word] = word_count.get(word, 0) + 1
print("Word Count:", word_count)  # Output: {'apple': 3, 'banana': 2, 'orange': 1}

"""
===========================================================
End of Python Dictionaries Tutorial
===========================================================
"""