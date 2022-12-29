Prove the functor laws for the list functor.

```haskell
instance Functor List where
    fmap :: (a -> b) -> [a] -> [b]
    fmap _ [] = []
    fmap f (x:xs) = (f x):(fmap f xs)
```

Functors preserve identity:
```haskell
fmap id x = id x

-- base case
fmap id [] = [] = id []

-- assume that
fmap id xs = id xs
-- then
fmap id (x:xs) = (id x):(fmap id xs)
               = x:(id xs)
               = x:xs
               = id (x:xs)
```

Functors preserve composition:
```haskell
fmap (f . g) x = fmap f . fmap g $ x

-- base case
fmap (f . g) [] = [] = fmap f [] = fmap f (fmap g []) = fmap f . fmap g $ []

-- assume that
fmap (f . g) xs = fmap f . fmap g $ xs
--then
fmap (f . g) (x:xs) = (f (g x)):(fmap (f . g) xs)
                    = (f (g x)):(fmap f . fmap g $ xs)
                    = (f (g x)):(fmap f (fmap g xs))
                    = fmap f ((g x):(fmap g xs))
                    = fmap f (fmap g (x:xs))
                    = fmap f . fmap g $ (x:xs)
```