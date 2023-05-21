module Main where

import Hypst
import Prelude hiding ((+), (-), (>))
import Styles (styles)


main :: IO ()
main = do 
  document "build/index.html"
  
  # "Inspiration"

  `img` "./typst.webp"

  - "Alternative zu Latex"
  - "Erinnert an Markdown"
  - "Erlaubt Scripting:"

  `img` "./scripting.png"

  > "Typst ist eine DSL"

  # "Idee: Hypst"
  > "Haskell basierte EDSL die das Verhalten von Typst imitiert"

  ## "Aufbau"  

  - "Infix Notation auf 'Dokument'"
  - "Deep Embedding"
  - "Pattern Matching für HTML Rendering"

  `include` styles

  |> end_document