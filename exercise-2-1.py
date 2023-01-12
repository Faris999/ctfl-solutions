import time

def memoize(f):
    memo = {}
    def new_f(x):
        if x not in memo:
            memo[x] = f(x)
        return memo[x]
    return new_f

def factorial(n):
    i = 1
    for j in range(1, n+1):
        i *= j
        print(i)
    return i

memo_fact = memoize(factorial)

print(memo_fact(50))
print(memo_fact(50))