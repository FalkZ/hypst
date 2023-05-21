module Styles where

import Hypst

styles = do document ""
    `style` "\
    \ li { font-size: 1rem; padding: 0.25em 0; } \
    \ p, blockquote { font-size: 1rem } \
    \ blockquote { border-left: 2px solid #ccd; background: #ccccdd22; margin: 0; padding: 1em; } \
    \"
