"""
===============================================================
Python File Handling Tutorial
===============================================================

This tutorial covers:
1. Basic file operations (open, read, write, close)
2. File modes (r, w, a, r+, w+, a+)
3. Text vs Binary file handling
4. File methods (readline, readlines, seek, tell)
5. Context managers (with statement)
6. Error handling in file operations
7. Working with CSV and JSON files

Each section includes examples, best practices, and real-world use cases.
"""

# ================================================================
# 1. Basic File Operations
# ================================================================

"""
Python's built-in `open()` function is used to work with files.
Operations include reading, writing, and appending.
Always close files after opening them to avoid resource leaks.
"""

# Example: Writing to a file
file = open("example.txt", "w")  # Open file in write mode
file.write("Hello, this is a sample text file.\n")  # Write a string
file.close()  # Close the file

# Example: Reading from a file
file = open("example.txt", "r")  # Open file in read mode
content = file.read()  # Read the entire file content
print(content)  # Output: Hello, this is a sample text file.
file.close()  # Close the file

# ================================================================
# 2. File Modes
# ================================================================

"""
File modes define how a file is opened:
- 'r': Read (default)
- 'w': Write (overwrites the file if it exists)
- 'a': Append
- 'r+': Read and write
- 'w+': Write and read (overwrites file)
- 'a+': Append and read
"""

# Example: Append mode
with open("example.txt", "a") as file:
    file.write("Appending a new line to the file.\n")  # Appends text

# ================================================================
# 3. Text vs Binary File Handling
# ================================================================

"""
Text files store data as plain text, while binary files store data in binary format.
Use 'b' with file modes for binary files (e.g., 'rb', 'wb').
"""

# Example: Writing binary data
binary_data = b"Binary data here."
with open("binary_file.bin", "wb") as binary_file:
    binary_file.write(binary_data)

# Example: Reading binary data
with open("binary_file.bin", "rb") as binary_file:
    data = binary_file.read()
    print(data)  # Output: b'Binary data here.'

# ================================================================
# 4. File Methods
# ================================================================

"""
Common file methods:
- `read(size)`: Reads specified bytes
- `readline()`: Reads one line
- `readlines()`: Reads all lines as a list
- `seek(offset)`: Moves the cursor
- `tell()`: Returns the cursor position
"""

# Example: Using readline and tell
with open("example.txt", "r") as file:
    line = file.readline()  # Reads the first line
    position = file.tell()  # Gets the current position
    print(f"Line: {line.strip()}, Position: {position}")

# Example: Using seek
with open("example.txt", "r") as file:
    file.seek(0)  # Moves cursor to the beginning
    print(file.read())  # Reads the entire file again

# ================================================================
# 5. Context Managers (with Statement)
# ================================================================

"""
The `with` statement ensures files are properly closed after use.
Recommended for all file operations.
"""

# Example: Using `with` for safer file handling
with open("example.txt", "r") as file:
    content = file.read()
    print(content)

# ================================================================
# 6. Error Handling in File Operations
# ================================================================

"""
Handle file-related errors using try-except blocks to avoid crashes.
"""

# Example: Handling a missing file
try:
    with open("nonexistent_file.txt", "r") as file:
        content = file.read()
except FileNotFoundError:
    print("Error: File not found!")

# Example: Handling permission errors
try:
    with open("/protected/example.txt", "w") as file:
        file.write("This will fail.")
except PermissionError:
    print("Error: Permission denied!")

# ================================================================
# 7. Working with CSV and JSON Files
# ================================================================

# ---------------------------------------------------------------
# a) CSV Files
# ---------------------------------------------------------------

"""
CSV files store tabular data. Use the `csv` module to read/write them.
"""

import csv

# Writing to a CSV file
with open("data.csv", "w", newline="") as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(["Name", "Age", "City"])  # Writing header
    writer.writerow(["Alice", 25, "New York"])  # Writing a row
    writer.writerow(["Bob", 30, "Los Angeles"])  # Writing another row

# Reading from a CSV file
with open("data.csv", "r") as csv_file:
    reader = csv.reader(csv_file)
    for row in reader:
        print(row)  # Outputs each row as a list

# ---------------------------------------------------------------
# b) JSON Files
# ---------------------------------------------------------------

"""
JSON files store structured data in key-value pairs. Use the `json` module.
"""

import json

# Writing to a JSON file
data = {"name": "Alice", "age": 25, "city": "New York"}
with open("data.json", "w") as json_file:
    json.dump(data, json_file)

# Reading from a JSON file
with open("data.json", "r") as json_file:
    loaded_data = json.load(json_file)
    print(loaded_data)  # Output: {'name': 'Alice', 'age': 25, 'city': 'New York'}

# ================================================================
# Best Practices for File Handling
# ================================================================

"""
1. Always close files or use `with` for automatic closing.
2. Validate file paths and handle errors gracefully.
3. Use relative paths for portability or `os` module for absolute paths.
4. Avoid overwriting files unintentionally.
"""

# ================================================================
# End of Tutorial
# ================================================================

print("Thank you for following this tutorial on Python file handling!")