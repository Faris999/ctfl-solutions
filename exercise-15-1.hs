phi :: Functor f => (forall x . (a -> x) -> f x) -> f a
phi alpha = alpha id

psi :: Functor f => f a -> (forall x . (a -> x) -> f x)
psi fa h = fmap h fa

-- phi . psi $ fa = phi (psi fa) = phi (\h fmap h fa) = fmap id fa = id fa
-- psi . phi $ alpha = psi (phi alpha) = psi (alpha id) = \h fmap h (alpha id) = \h fmap h . alpha $ id = \h alpha . fmap h $ id = \h alpha (h . id) = \h alpha h = alpha