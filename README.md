# Hypst

> EDSL to create html documents in Haskell with a Markdown / Typst inspired syntax

## Example
This project allows the following haskell code:
```haskell
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

  ## "Aufbau 2"  

  - "Infix Notation auf 'Dokument'"
  - "Deep Embedding"
  - "Pattern Matching für HTML Rendering"

  `input` styles

  |> end_document
```

To be compiled into:

```html
<h1>Inspiration</h1>
<img src='./typst.webp' ></img>
<li>Alternative zu Latex</li>
<li>Erinnert an Markdown</li>
<li>Erlaubt Scripting:</li>
<img src='./scripting.png' ></img>
<blockquote>Typst ist eine DSL</blockquote>
<h1>Idee: Hypst</h1>
<blockquote>Haskell basierte EDSL die das Verhalten von Typst imitiert</blockquote>
<h2>Aufbau 2</h2>
<li>Infix Notation auf 'Dokument'</li>
<li>Deep Embedding</li>
<li>Pattern Matching für HTML Rendering</li>
<style> li { font-size: 1rem; padding: 0.25em 0; }  p, blockquote { font-size: 1rem }  blockquote { border-left: 2px solid #ccd; background: #ccccdd22; margin: 0; padding: 1em; }  img { margin: 1em 0; } </style>
```
