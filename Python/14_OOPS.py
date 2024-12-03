"""
====================================================
Python Tutorial: Object-Oriented Programming (OOP)
====================================================

This tutorial covers the following OOP concepts:
1. Class definition and basic structure
2. Class attributes (instance and class variables)
3. Constructor (__init__) method
4. Instance methods and self parameter
5. Inheritance and polymorphism
6. Encapsulation with private and protected attributes
7. Static and class methods
8. Property decorators and getters/setters

Object-Oriented Programming (OOP) is a paradigm that organizes
code into reusable "objects," each containing data (attributes)
and behaviors (methods).
"""

# ====================================================
# 1. Class Definition and Basic Structure
# ====================================================

"""
A class is a blueprint for creating objects. It defines the structure
(attributes and methods) of its objects.
"""

# Example: A simple class representing a car
class Car:
    """A class representing a car."""

    # Constructor to initialize attributes
    def __init__(self, make, model, year):
        self.make = make  # Instance attribute
        self.model = model  # Instance attribute
        self.year = year  # Instance attribute

    # Method to describe the car
    def describe(self):
        """Returns a formatted description of the car."""
        return f"{self.year} {self.make} {self.model}"

# Creating objects from the class
car1 = Car("Toyota", "Camry", 2022)
car2 = Car("Honda", "Civic", 2023)

# Accessing attributes and methods
print(car1.describe())  # Output: 2022 Toyota Camry
print(car2.describe())  # Output: 2023 Honda Civic

print()  # Line break for readability

# ====================================================
# 2. Class Attributes (Instance and Class Variables)
# ====================================================

"""
Class attributes are shared across all instances of a class,
while instance attributes are unique to each object.
"""

class Dog:
    """A class representing a dog."""
    species = "Canis familiaris"  # Class attribute

    def __init__(self, name, age):
        self.name = name  # Instance attribute
        self.age = age  # Instance attribute

# Creating instances
dog1 = Dog("Buddy", 3)
dog2 = Dog("Bella", 5)

# Accessing class and instance attributes
print(f"Species: {Dog.species}")  # Output: Species: Canis familiaris
print(f"{dog1.name} is {dog1.age} years old.")  # Output: Buddy is 3 years old.
print(f"{dog2.name} is {dog2.age} years old.")  # Output: Bella is 5 years old.

print()

# ====================================================
# 3. Constructor (__init__) Method
# ====================================================

"""
The constructor (__init__) is a special method called automatically
when an object is created. It is used to initialize attributes.
"""

# Example: BankAccount class
class BankAccount:
    """A class representing a bank account."""
    def __init__(self, owner, balance=0):
        self.owner = owner
        self.balance = balance

    def deposit(self, amount):
        """Deposits money into the account."""
        self.balance += amount
        return f"${amount} deposited. New balance: ${self.balance}"

    def withdraw(self, amount):
        """Withdraws money from the account."""
        if amount > self.balance:
            return "Insufficient funds."
        self.balance -= amount
        return f"${amount} withdrawn. New balance: ${self.balance}"

# Creating an account
account = BankAccount("Alice", 1000)
print(account.deposit(500))  # Output: $500 deposited. New balance: $1500
print(account.withdraw(200))  # Output: $200 withdrawn. New balance: $1300

print()

# ====================================================
# 4. Instance Methods and self Parameter
# ====================================================

"""
Instance methods are functions defined inside a class that operate
on an instance's data. The 'self' parameter refers to the instance
calling the method.
"""

# Example: Using self in methods
class Person:
    """A class representing a person."""
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def introduce(self):
        """Introduce the person."""
        return f"Hi, my name is {self.name} and I am {self.age} years old."

# Creating an instance
person = Person("John", 30)
print(person.introduce())  # Output: Hi, my name is John and I am 30 years old.

print()

# ====================================================
# 5. Inheritance and Polymorphism
# ====================================================

"""
Inheritance allows a class (child) to inherit attributes and methods
from another class (parent). Polymorphism allows methods to behave
differently based on the object's type.
"""

# Parent class
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} makes a sound."

# Child classes
class Cat(Animal):
    def speak(self):
        return f"{self.name} says Meow."

class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof."

# Using polymorphism
animals = [Cat("Whiskers"), Dog("Fido")]
for animal in animals:
    print(animal.speak())  
    # Output: Whiskers says Meow.
    #         Fido says Woof.

print()

# ====================================================
# 6. Encapsulation with Private and Protected Attributes
# ====================================================

"""
Encapsulation restricts access to certain attributes or methods.
Protected attributes (_attr) are accessible but intended for internal use.
Private attributes (__attr) are truly restricted.
"""

class Student:
    def __init__(self, name, grade):
        self._name = name  # Protected attribute
        self.__grade = grade  # Private attribute

    def get_grade(self):
        """Access private attribute."""
        return self.__grade

student = Student("Alice", "A")
print(student.get_grade())  # Output: A

print()

# ====================================================
# 7. Static and Class Methods
# ====================================================

"""
- Static methods do not operate on instance or class attributes.
- Class methods operate on the class itself.
"""

class MathUtils:
    @staticmethod
    def add(a, b):
        return a + b

    @classmethod
    def info(cls):
        return f"This is the {cls.__name__} class."

print(MathUtils.add(10, 20))  # Output: 30
print(MathUtils.info())  # Output: This is the MathUtils class.

print()

# ====================================================
# 8. Property Decorators and Getters/Setters
# ====================================================

"""
Property decorators provide controlled access to attributes,
using @property, @<property>.setter, and @<property>.deleter.
"""

class Product:
    def __init__(self, name, price):
        self.name = name
        self._price = price

    @property
    def price(self):
        return self._price

    @price.setter
    def price(self, value):
        if value < 0:
            raise ValueError("Price cannot be negative.")
        self._price = value

product = Product("Laptop", 1000)
print(product.price)  # Output: 1000
product.price = 1200  # Updating the price
print(product.price)  # Output: 1200
# product.price = -500  # Raises ValueError

print()