safeRoot ::  Float -> Maybe Float
safeRoot n = if n >= 0 then Just (sqrt n) else Nothing

safeReciprocal :: Float -> Maybe Float
safeReciprocal 0 = Nothing
safeReciprocal n = Just (1 / n)

(>=>) :: (a -> Maybe b) -> (b -> Maybe c) -> a -> Maybe c
(>=>) f g = \x ->
    let f' = f x in case f' of
        Nothing -> Nothing
        Just y -> g y

safeRootReciprocal :: Float -> Maybe Float
safeRootReciprocal = safeRoot >=> safeReciprocal

main :: IO ()
main = do
    print $ safeRootReciprocal 2
    print $ safeRootReciprocal (-2)