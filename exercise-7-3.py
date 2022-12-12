compose = lambda f: lambda g: lambda x: f(g(x))

fmap = compose

str_ascii_to_char = fmap(chr)(int)

print(str_ascii_to_char('72'))



