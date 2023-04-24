{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import Control.Monad
import Control.Monad.IO.Class
import qualified Data.ByteString.Lazy as BL
import Data.Either
import Data.List (intersperse)
import Data.Monoid (mconcat, mempty, (<>))
import qualified Data.Text as T
import Text.Pandoc
import Text.Pandoc.Builder
import Text.Pandoc.PDF

export :: (MonadIO m) => String -> Pandoc -> m (Either BL.ByteString BL.ByteString)
export tmpl pdoc = liftIO $ makePDF "xelatex" writeLaTeX (def {writerStandalone = True, writerTemplate = tmpl}) pdoc

main :: IO ()
main = do
  letter <- getLetter
  temp <- readFile "template.tex"
  let str_should_have_something = writeLaTeX (def {writerStandalone = True, writerTemplate = temp}) letter
  print str_should_have_something
  mybytes <- export temp letter

  case mybytes of
    Right b -> BL.writeFile "mypdf.pdf" b
    Left _ -> putStrLn "Export error"
