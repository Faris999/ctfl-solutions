{-# LANGUAGE TypeFamilies #-}
data Stream x = Cons x (Stream x)

class Representable f where
    type Rep f :: *
    tabulate :: (Rep f -> x) -> f x
    index :: f x -> Rep f -> x

instance Representable Stream where
    type Rep Stream = Integer
    
    tabulate :: (Rep Stream -> x) -> Stream x
    tabulate f = Cons (f 0) (tabulate (f . (+1)))

    index :: Stream x -> Rep Stream -> x
    index (Cons b bs) 0 = b
    index (Cons b bs) n = index bs (n-1)

square :: Integer -> Integer
square n = n * n

squareMemo :: Stream Integer
squareMemo = tabulate square