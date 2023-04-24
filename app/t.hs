(#) :: Blocks -> String -> Blocks
(#) doc str = doc <> header 1 str

(§) :: Blocks -> String -> Blocks
(§) doc str = doc <> para str


{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import Control.Monad (mzero)
import qualified Data.ByteString.Lazy as BL
import Data.List (intersperse)
import Data.Monoid (mconcat, mempty, (<>))
import qualified Data.Text as T
import Text.Pandoc
import Text.Pandoc.Builder



mydoc :: Pandoc
mydoc =
  doc $
    header 1 "Hello!"
      <> para (emph "hello world" <> ".")

main :: IO ()
main = do
  let letter = mydoc
  docx <- runIO (writeDocx def letter) >>= handleError
  BL.writeFile "letter.docx" docx
  putStrLn "Created letter.docx"