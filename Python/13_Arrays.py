"""
===============================================================
Python Tutorial: Arrays
===============================================================

This tutorial covers:
1. What arrays are in Python and their relationship with lists.
2. Array creation using both Python lists and the NumPy library.
3. Basic array operations: indexing, slicing, appending, and removing elements.
4. Common array methods and properties.
5. Practical examples of array manipulation.
6. Performance comparison: arrays vs lists.
7. Best practices for using arrays.

Arrays are used to store multiple values of the same type in a single variable. 
Python's standard library does not have a native array type like other languages (e.g., C or Java), 
but arrays can be implemented using the `array` module or the `NumPy` library.
"""

# ===============================================================
# Section 1: What Are Arrays?
# ===============================================================

"""
An array is a collection of elements of the same type, stored in contiguous memory locations.
- In Python, you can use lists as flexible arrays since they can hold mixed data types.
- For numerical computations, the `array` module or the `NumPy` library is preferred 
  as they offer better performance and additional features.
"""

# ===============================================================
# Section 2: Array Creation
# ===============================================================

# Using Python's built-in `array` module
import array

# Create an array of integers
int_array = array.array('i', [1, 2, 3, 4, 5])  # 'i' specifies integer type
print("Array created with array module:", int_array)  
# Output: array('i', [1, 2, 3, 4, 5])

# Using NumPy for array creation
import numpy as np

# Create a 1D array
numpy_array = np.array([1, 2, 3, 4, 5])
print("Array created with NumPy:", numpy_array)  
# Output: [1 2 3 4 5]

# Create a 2D array
two_d_array = np.array([[1, 2, 3], [4, 5, 6]])
print("2D Array:\n", two_d_array)  
# Output: 
# [[1 2 3]
#  [4 5 6]]

# ===============================================================
# Section 3: Basic Array Operations
# ===============================================================

"""
Basic operations on arrays include:
1. Indexing: Accessing specific elements.
2. Slicing: Extracting subarrays.
3. Appending and removing elements.
"""

# Indexing
print("First element of int_array:", int_array[0])  # Output: 1
print("Element at position (1, 2) in two_d_array:", two_d_array[1, 2])  
# Output: 6

# Slicing
print("Slice of numpy_array [1:4]:", numpy_array[1:4])  # Output: [2 3 4]

# Appending elements (NumPy arrays cannot grow dynamically; use `np.append`)
numpy_array = np.append(numpy_array, [6, 7])
print("After appending [6, 7]:", numpy_array)  # Output: [1 2 3 4 5 6 7]

# Removing elements (NumPy uses `np.delete`)
numpy_array = np.delete(numpy_array, 2)  # Removes the element at index 2
print("After removing index 2:", numpy_array)  # Output: [1 2 4 5 6 7]

print()  # Line break for readability

# ===============================================================
# Section 4: Array Methods and Properties
# ===============================================================

"""
Common methods and properties of arrays:
1. `shape`: Returns the dimensions of the array (useful for multidimensional arrays).
2. `size`: Total number of elements in the array.
3. `dtype`: Data type of the array elements.
4. Mathematical operations (NumPy arrays support vectorized operations).
"""

# Example: Properties of NumPy arrays
print("Shape of two_d_array:", two_d_array.shape)  # Output: (2, 3)
print("Size of two_d_array:", two_d_array.size)    # Output: 6
print("Data type of two_d_array:", two_d_array.dtype)  # Output: int64 (may vary)

# Example: Vectorized operations
array_a = np.array([1, 2, 3])
array_b = np.array([4, 5, 6])

# Element-wise addition
print("Element-wise addition:", array_a + array_b)  # Output: [5 7 9]

# Element-wise multiplication
print("Element-wise multiplication:", array_a * array_b)  # Output: [ 4 10 18]

print()  # Line break for readability

# ===============================================================
# Section 5: Practical Examples of Array Manipulation
# ===============================================================

# Example 1: Sum of elements in an array
sum_elements = np.sum(numpy_array)
print("Sum of elements in numpy_array:", sum_elements)  # Output: 25

# Example 2: Reshaping arrays
reshaped_array = np.reshape(numpy_array, (2, 3))
print("Reshaped array (2x3):\n", reshaped_array)
# Output:
# [[1 2 4]
#  [5 6 7]]

# Example 3: Finding maximum and minimum
print("Max value:", np.max(reshaped_array))  # Output: 7
print("Min value:", np.min(reshaped_array))  # Output: 1

print()  # Line break for readability

# ===============================================================
# Section 6: Arrays vs Lists Performance Comparison
# ===============================================================

import time

# Create large arrays and lists
large_array = np.arange(1, 1000000)
large_list = list(range(1, 1000000))

# Measure NumPy performance
start_time = time.time()
large_array_sum = np.sum(large_array)
end_time = time.time()
print("Time taken by NumPy array:", end_time - start_time)

# Measure list performance
start_time = time.time()
large_list_sum = sum(large_list)
end_time = time.time()
print("Time taken by Python list:", end_time - start_time)

"""
Performance Observation:
NumPy arrays are significantly faster for numerical operations due to optimized C implementations.
"""

# ===============================================================
# Section 7: Best Practices and Common Pitfalls
# ===============================================================

"""
Best Practices:
1. Use NumPy arrays for numerical data for better performance and more functionality.
2. Choose the appropriate data type to save memory.
3. Use vectorized operations instead of loops for efficiency.

Common Pitfalls:
1. Forgetting that NumPy arrays have fixed sizes (cannot grow dynamically).
2. Mixing incompatible data types in arrays (can cause unexpected behavior).
3. Using `append` excessively on large arrays (creates new arrays each time, causing inefficiency).
"""