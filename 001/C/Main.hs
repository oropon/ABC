--{--
import Test.Hspec
import Control.Monad
--}

main :: IO()
main = getLine >>= putStrLn . solve

solve :: String -> String
solve = undefined

-- Test

test :: IO()
test = hspec $ do
  describe "test" $ do
    forM_ testList $ \(input, expected) ->
      it (input ++ " -> " ++ expected) $
      solve input `shouldBe` expected

testList :: [(String, String)]
testList = [("2750 628", "W 5")
           ,("161 8", "C 0")
           ,("3263 15", "NNW 1")
           ,("1462 1959", "SE 12")
           ,("1687 1029", "SSE 8")
           ,("2587 644", "WSW 5")
           ,("113 201", "NNE 3")
           ,("2048 16", "SSW 1")]
