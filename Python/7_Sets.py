"""
===========================================================
Python Tutorial: Sets in Python
===========================================================

This tutorial covers the following topics:
1. What Sets are in Python and their key characteristics
2. How Sets differ from other data structures (lists, tuples, dictionaries)
3. Common Set operations (union, intersection, difference)
4. Set methods and their use cases
5. Best practices and performance considerations

Additionally, practical examples demonstrate:
- Creating Sets with different data types
- Adding and removing elements
- Performing set operations
- Set comprehension
- Real-world applications of Sets
- Common pitfalls and how to avoid them
"""

# ===========================================================
# Section 1: What Sets Are in Python and Their Characteristics
# ===========================================================

"""
A set is an unordered collection of unique elements in Python. Key characteristics:
- Sets are mutable (elements can be added/removed), but they do not allow duplicates.
- Sets are unordered, meaning they do not maintain element insertion order.
- Sets can contain only immutable (hashable) elements like numbers, strings, and tuples.
"""

# Example: Creating Sets
empty_set = set()  # Empty set (note: {} creates a dictionary)
int_set = {1, 2, 3, 4, 5}
mixed_set = {1, "Python", 3.14, (5, 6)}

print("Empty Set:", empty_set)  # Output: set()
print("Integer Set:", int_set)  # Output: {1, 2, 3, 4, 5}
print("Mixed Set:", mixed_set)  # Output: {1, 'Python', 3.14, (5, 6)}

# ===========================================================
# Section 2: How Sets Differ from Other Data Structures
# ===========================================================

"""
Sets vs Lists:
- Sets do not allow duplicates; lists can contain duplicates.
- Sets are unordered; lists maintain insertion order.

Sets vs Tuples:
- Sets are mutable; tuples are immutable.
- Sets do not allow duplicates; tuples allow duplicates.

Sets vs Dictionaries:
- Sets contain only values; dictionaries contain key-value pairs.
"""

# Example: Eliminating Duplicates with Sets
list_with_duplicates = [1, 2, 2, 3, 4, 4, 5]
unique_elements = set(list_with_duplicates)
print("Unique Elements from List:", unique_elements)  # Output: {1, 2, 3, 4, 5}

# ===========================================================
# Section 3: Common Set Operations (Union, Intersection, Difference)
# ===========================================================

"""
Sets support mathematical operations such as union, intersection, and difference.

1. Union: Combines elements from both sets, removing duplicates.
2. Intersection: Returns elements common to both sets.
3. Difference: Returns elements in one set but not in the other.
"""

# Example: Union
set_a = {1, 2, 3}
set_b = {3, 4, 5}
union_set = set_a | set_b
print("Union of Sets:", union_set)  # Output: {1, 2, 3, 4, 5}

# Example: Intersection
intersection_set = set_a & set_b
print("Intersection of Sets:", intersection_set)  # Output: {3}

# Example: Difference
difference_set = set_a - set_b
print("Difference of Sets (A - B):", difference_set)  # Output: {1, 2}

# ===========================================================
# Section 4: Set Methods and Their Use Cases
# ===========================================================

"""
Common Set Methods:
1. add(): Adds a single element to the set.
2. remove(): Removes a specified element (raises KeyError if not found).
3. discard(): Removes a specified element (does not raise an error if not found).
4. pop(): Removes and returns an arbitrary element.
5. clear(): Removes all elements from the set.
"""

# Adding and Removing Elements
example_set = {1, 2, 3}
example_set.add(4)
print("After Adding 4:", example_set)  # Output: {1, 2, 3, 4}

example_set.remove(2)  # Removes element 2
print("After Removing 2:", example_set)  # Output: {1, 3, 4}

example_set.discard(5)  # Discards element 5 (no error if not found)
print("After Discarding 5:", example_set)  # Output: {1, 3, 4}

# Using pop() and clear()
popped_element = example_set.pop()
print("Popped Element:", popped_element)  # Output: 1 (or any other arbitrary element)
example_set.clear()
print("Set After Clearing:", example_set)  # Output: set()

# ===========================================================
# Section 5: Set Comprehension
# ===========================================================

"""
Set comprehension allows creating sets in a concise way. Syntax:
{expression for item in iterable if condition}
"""

# Example: Set of Squares
squares_set = {x**2 for x in range(1, 6)}
print("Set of Squares:", squares_set)  # Output: {1, 4, 9, 16, 25}

# Example: Filtering Unique Even Numbers
unique_evens = {x for x in [1, 2, 2, 3, 4, 4, 5] if x % 2 == 0}
print("Unique Evens:", unique_evens)  # Output: {2, 4}

# ===========================================================
# Section 6: Real-World Applications of Sets
# ===========================================================

"""
Sets are commonly used for:
1. Removing duplicates from a list.
2. Performing fast membership testing.
3. Mathematical operations on data sets.
4. Storing unordered, unique data elements.
"""

# Example: Membership Testing
emails = {"user1@example.com", "user2@example.com", "user3@example.com"}
print("Is 'user2@example.com' in the set?", "user2@example.com" in emails)  # Output: True

# Example: Finding Common Friends
friends_set1 = {"Alice", "Bob", "Charlie"}
friends_set2 = {"Bob", "Diana", "Eve"}
common_friends = friends_set1 & friends_set2
print("Common Friends:", common_friends)  # Output: {'Bob'}

# ===========================================================
# Section 7: Best Practices and Performance Considerations
# ===========================================================

"""
Best Practices:
- Use sets when the uniqueness of elements is required.
- Use set operations for efficient data analysis.
- Convert data to sets for fast membership testing.

Performance Considerations:
- Sets are optimized for fast membership testing and unique element storage.
- Avoid using mutable elements (like lists) as set elements, as they are not hashable.
"""

# Example: Avoiding Common Pitfalls
try:
    invalid_set = {[1, 2], [3, 4]}  # Attempt to use lists as set elements
except TypeError as e:
    print("Error:", e)  # Output: unhashable type: 'list'

# Instead, use tuples for immutable elements:
valid_set = {(1, 2), (3, 4)}
print("Valid Set with Tuples:", valid_set)  # Output: {(1, 2), (3, 4)}

"""
===========================================================
End of Python Sets Tutorial
===========================================================
"""