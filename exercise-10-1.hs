alpha :: Maybe a -> [a]
alpha Nothing = []
alpha (Just x) = [x]

-- Naturality condition
-- fmap f . alpha = alpha . fmap f
-- 
-- Nothing case:
-- fmap f . alpha $ Nothing = fmap f (alpha Nothing) = fmap f [] = []
-- alpha . fmap f $ Nothing = alpha (fmap f Nothing) = alpha Nothing = []
-- 
-- Just case:
-- fmap f . alpha $ (Just x) = fmap f (alpha (Just x)) = fmap f [x] = [f x]
-- alpha . fmap f $ (Just x) = alpha (fmap f (Just x)) = alpha (Just (f x)) = [f x]

main = do
    print $ fmap show . alpha $ Just 5
    print $ alpha . fmap show $ Just 5
