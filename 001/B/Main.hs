--{--
import Test.Hspec
import Control.Monad
--}

main :: IO()
main = getLine >>= putStrLn . solve . read

solve :: Int -> String
solve m = padZero $ converter m $ m

padZero :: Int -> String
padZero n = reverse $ take 2 $ reverse $ '0': show n

converter :: Int -> (Int -> Int)
converter m
  | m < 100 = (*0)
  | m <= 5000 = (`div` 100)
  | m <= 30000 = (+50) . toKm
  | m <= 70000 = (+80) . (`div` 5) . (subtract 30) . toKm
  | otherwise = (+89) . (*0)
  where
    toKm = flip div 1000

-- Test

test :: IO()
test = hspec $ do
  describe "test" $ do
    forM_ testList $ \(input, expected) ->
      it (show input ++ " -> " ++ expected) $
      solve input `shouldBe` expected

testList :: [(Int, String)]
testList = [(15000, "65")
           ,(75000, "89")
           ,(200, "02")]
