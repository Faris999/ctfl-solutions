from math import sqrt
from typing import Callable, TypeVar, Generic, Any

T = TypeVar('T')

class Optional(Generic[T]):
    def __init__(self, data: T = None) -> None:
        self._data = data

    def is_valid(self) -> bool:
        return self._data is not None

    def get(self) -> T:
        return self._data

    def __repr__(self) -> str:
        if self.is_valid():
            return f'Just {str(self._data)}'
        return 'Nothing'

def identity(x: T) -> Optional[T]:
    return Optional(x)

A = TypeVar('A')
B = TypeVar('B')
C = TypeVar('C')

def compose(f: Callable[[A], Optional[B]], g: Callable[[B], Optional[C]]) -> Callable[[A], Optional[C]]: 
    def h(x: A) -> Optional[C]:
        g_output = g(x)
        if g_output.is_valid():
            return f(g_output.get())
        return Optional()
    return h

def safe_root(x):
    if x >= 0:
        return Optional(sqrt(x))
    return Optional()

def safe_reciprocal(x):
    if x != 0:
        return Optional(1/x)
    return Optional()

def safe_root_reciprocal(x):
    return compose(safe_root, safe_reciprocal)(x)

print(safe_root(-1)) # Nothing
print(safe_root(2)) # Just 1.414...
print(safe_reciprocal(0)) # Nothing
print(safe_reciprocal(1)) # Just 1.0
print(safe_reciprocal(2)) # Just 0.5
print(safe_root_reciprocal(0)) # Nothing
print(safe_root_reciprocal(1)) # Just 1.0
print(safe_root_reciprocal(2)) # Just 0.707...
print(safe_root_reciprocal(-1)) # Nothing
