import Data.Functor.Const
import Data.Functor.Identity

type Maybe' a = Either (Const () a) (Identity a)

iso :: Maybe' a -> Maybe a
iso (Left (Const ())) = Nothing
iso (Right (Identity a)) = Just a

iso' :: Maybe a -> Maybe' a
iso' Nothing = Left (Const ())
iso' (Just a) = Right (Identity a)

-- iso (iso' Nothing) = iso (Left (Const ())) = Nothing
-- iso (iso' (Just a)) = iso (Right (Identity a)) = Just a
-- iso' (iso (Left (Const ()))) = iso' Nothing = Left (Const ())
-- iso' (iso (Right (Identity a))) = iso' (Just a) = Right (Identity a)