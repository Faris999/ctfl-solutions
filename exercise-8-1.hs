import Data.Bifunctor
data Pair a b = Pair a b

instance Bifunctor Pair where
    bimap :: (a -> b) -> (c -> d) -> Pair a c -> Pair b d
    bimap f g (Pair a c) = Pair (f a) (g c)
    first :: (a -> b) -> Pair a c -> Pair b c
    first f (Pair a c) = Pair (f a) c
    second :: (b -> c) -> Pair a b -> Pair a c
    second g (Pair a b) = Pair a (g b)