module Main where

import Hypst

main :: IO ()
main = do document "test.html"
  
  # "Heading"
  ## "Subheading"
  ### "Subsubheading"

  § "this is a paragraph"


  `img` "./go.png"

  |> end_document
