from __future__ import annotations
from enum import Enum
from typing import Callable, TypeVar, Self, Generic, Union

A = TypeVar('A')
B = TypeVar('B')
C = TypeVar('C')
D = TypeVar('D')

class Bifunctor:
    def bimap(self, f: Callable[[A], B], g: Callable[[C], D]) -> Self:        
        return self.first(f).second(g)

    def first(self, f: Callable[[A], B]) -> Self:
        return self.bimap(f, lambda x: x)

    def second(self, g: Callable[[C], D]) -> Self:
        return self.bimap(lambda x: x, g)

class Pair(Bifunctor, Generic[A, B]):
    def __init__(self, a: A, b: B) -> Self:
        self.a = a
        self.b = b

    def bimap(self, f: Callable[[A], C], g: Callable[[B], D]) -> Self:
        return Pair(f(self.a), g(self.b))
    
    def test(self) -> None:
        print('test')

    # def first(self, f):
    #     return Pair(f(self.a), self.b)

    # def second(self, g):
    #     return Pair(self.a, g(self.b))

    def __repr__(self) -> str:
        return f'({self.a}, {self.b})'

class LeftRight(Enum):
    LEFT = 1
    RIGHT = 2

class Either(Bifunctor, Generic[A, B]):
    def __init__(self, value: Union[A, B], left_or_right: LeftRight):
        self.value = value
        self.left_or_right = left_or_right

    def bimap(self, f: Callable[[A], C], g: Callable[[B], D]) -> Self:
        function = f if self.left_or_right == LeftRight.LEFT else g
        return Either(function(self.value), self.left_or_right)

    def __repr__(self) -> str:
        return f'{self.left_or_right} {self.value}'

pair = Pair(5, 3)

either1 = Either(5, LeftRight.RIGHT)

either2 = Either("error", LeftRight.LEFT)

def f(x: int) -> int:
    return x + 2

def g(x):
    return x * 3

print(pair.first(f))
print(pair.second(g))
print(pair.bimap(f, g))
print(pair.first(f).test())

print(either1.bimap(f, g))
print(either1.first(f))
print(either1.second(f))

def h(x):
    return x[-1]

def i(x):
    return x + "blah"
print(either2.first(h))
print(either2.second(i))
print(either2.first(i))