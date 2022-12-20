type Reader r a = r -> a

alpha :: Reader Bool a -> Maybe a
alpha f = Nothing

beta :: Reader Bool a -> Maybe a
beta f = Just (f True)

gamma :: Reader Bool a -> Maybe a
gamma f = Just (f False)

-- delta f = fmap f (something of type Maybe Bool)

-- Naturality Condition
-- alpha:
-- fmap f . alpha $ g = fmap f (alpha g) = fmap f Nothing = Nothing
-- alpha . fmap f $ g = alpha (fmap f g) = alpha (f . g) = Nothing
--
-- beta:
-- fmap f . beta $ g = fmap f (beta g) = fmap f (Just (g True)) = Just (f (g True))
-- beta . fmap f $ g = beta (fmap f g) = beta (f . g) = Just ((f . g) True) = Just (f (g True))
--
-- gamma:
-- fmap f . gamma $ g = fmap f (gamma g) = fmap f (Just (g False)) = Just (f (g False))
-- gamma . fmap f $ g = gamma (fmap f g) = gamma (f . g) = Just ((f . g) False) = Just (f (g False))

f :: Bool -> Int
f True = 1
f False = 0

main = do
    print $ fmap (*2) . alpha $ f
    print $ alpha . fmap (*2) $ f
    print $ fmap (*2) . beta $ f
    print $ fmap (*2) . beta $ f
    print $ gamma . fmap (*2) $ f
    print $ gamma . fmap (*2) $ f