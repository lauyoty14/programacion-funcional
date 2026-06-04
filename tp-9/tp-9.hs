data QuadTree a = LeafQ a
    | NodeQ (QuadTree a) (QuadTree a)
        (QuadTree a) (QuadTree a) deriving Show
data Color = RGB Int Int Int
type Image = QuadTree Color

compress :: Eq a => QuadTree a -> QuadTree a
compress (LeafQ a)                                       = LeafQ a  
compress (NodeQ (LeafQ a) (LeafQ b) (LeafQ c) (LeafQ d)) = compress' a b c d
compress (NodeQ n1 n2 n3 n4)                             = NodeQ (compress n1) (compress n2) (compress n3) (compress n4)

compress' :: Eq a => a -> a -> a -> a -> QuadTree a
compress' a b c d = if a == b && b == c && c == d
                    then LeafQ a
                    else NodeQ (LeafQ a) (LeafQ b) (LeafQ c) (LeafQ d)