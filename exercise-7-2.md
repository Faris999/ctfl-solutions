```haskell
type Reader r a = r -> a

instance Functor (Reader r) where
    fmap = (.)
```

Functors preserve identity:
fmap id = id
fmap id f = id . f = f = id f

Functors preserve composition:
fmap (g . f) = fmap g . fmap f
fmap (g . f) h = (g . f) . h = g . (f . h) = g . (fmap f h) = fmap g (fmap f h) = fmap g . fmap f $ h
