from enum import Enum
from math import sqrt

class LeftRight(Enum):
    LEFT = 1
    RIGHT = 2

class Either():
    def __init__(self, value, left_or_right):
        self._value = value
        self._left_or_right = left_or_right

    def get(self):
        return self._value
    
    def get_left_or_right(self):
        return self._left_or_right

    def __repr__(self) -> str:
        if self.get_left_or_right() == LeftRight.LEFT:
            return f'Left {str(self.get())}'
        return f'Right {str(self.get())}'

    def __eq__(self, other):
        if isinstance(other, Either):
            return self.get() == other.get() and self.get_left_or_right() == other.get_left_or_right()

def left(x):
    return Either(x, LeftRight.LEFT)

def right(x):
    return Either(x, LeftRight.RIGHT)

def root_either(x):
    if x >= 0:
        return right(sqrt(x))
    return left("Negative number")

print(root_either(-1)) # Left Negative number
print(root_either(2)) # Right 1.414...