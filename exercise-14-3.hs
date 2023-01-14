{-# LANGUAGE TypeFamilies #-}

data Stream x = Cons x (Stream x)

class Representable f where
    type Rep f :: *
    tabulate :: (Rep f -> x) -> f x
    index :: f x -> Rep f -> x

instance Representable ((->) a) where
    type Rep ((->) a) = a
    tabulate :: (a -> x) -> (a -> x)
    tabulate = id
    index :: (a -> x) -> a -> x
    index = id