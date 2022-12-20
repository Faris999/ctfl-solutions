type Reader r a = r -> a

alpha :: Reader () a -> [a]
alpha f = [f ()]

beta :: Reader () a -> [a]
beta f = [f (), f ()]

-- One can create as many natural transformations
-- just by adding more instances of f () at the end of the list

-- Naturality condition
-- fmap f . alpha = alpha . fmap f
--
-- alpha:
-- fmap f . alpha $ g = fmap f (alpha g) = fmap f [g ()] = [f (g ())]
-- alpha . fmap f $ g = alpha (fmap f g) = alpha (f . g) = [(f . g) ()] = [f (g ())]
--
-- beta:
-- fmap f . beta $ g = fmap f (beta g) = fmap f [g (), g ()] = [f (g ()), f (g ())]
-- beta . fmap f $ g = beta (fmap f g) = beta (f . g) = [(f . g) (), (f . g) ()] = [f (g ()), f (g ())]

f :: Reader () Int
f () = 5

g :: Reader () String
g () = "Hello"

main = do
    print $ fmap (*2) . alpha $ f
    print $ alpha . fmap (*2) $ f
    print $ fmap (++" world") . beta $ g
    print $ beta . fmap (++" world") $ g