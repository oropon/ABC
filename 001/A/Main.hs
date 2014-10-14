{--
import Control.Monad
import Test.Hspec
--}

main :: IO()
main = do
  h1 <- getLine
  h2 <- getLine
  putStrLn $ show $ solve (read h1) (read h2)

solve :: Int -> Int -> Int
solve = (-)

-- Test
test :: IO()
test = hspec $ do
  describe "test" $ do
    forM_ testList $ \(h1, h2, expected) ->
      it ("H1: " ++ show h1 ++ " H2: " ++ show h2 ++ " -> " ++ show expected) $ 
      solve h1 h2 `shouldBe` expected

testList :: [(Int, Int, Int)]
testList = [(15, 10, 5)
           ,(0, 0, 0)
           ,(5, 20, -15)]


