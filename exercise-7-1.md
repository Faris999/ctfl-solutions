Can we turn the `Maybe` type constructor into a functor by defining:

```haskell
fmap _ _ = Nothing
```

which ignores both of it's arguments?

Functors preserve identity:

fmap id = id

fmap id Nothing = Nothing = id Nothing
fmap id (Just x) = Nothing /= id (Just x)

Functors preserve composition

fmap (g . f) Nothing = Nothing = fmap g . fmap f $ Nothing

fmap (g . f) (Just x) = Nothing
fmap g . fmap f $ Just x = Nothing

It doesn't preserve identity