module Render where

import Data.List (intercalate)
import Types
import Utils

type Attribute = (String, String)

tagSimple :: String -> String -> String
tagSimple name content = "<" ++ name ++ ">" ++ content ++ "</" ++ name ++ ">"

a :: Attribute -> String
a (k, v) = k ++ "='" ++ v ++ "'"

attributes :: [Attribute] -> String
attributes attr = intercalate "\n" $ (a <$> attr)

tag :: String -> String -> [Attribute] -> String
tag name content attr = "<" ++ name ++ " " ++ (attributes attr) ++ " >" ++ content ++ "</" ++ name ++ ">"

h :: Integer -> String -> String
h level = tagSimple $ "h" ++ (show level)

render :: Tag -> String
render t = case t of
  Heading nr content -> h nr content
  Paragraph content -> tagSimple "p" content
  Image url -> tag "img" "" [("src", url)]

renderAll :: [Tag] -> String
renderAll doc =
  intercalate "\n" $
    render <$> (doc)

end_document :: Document -> IO ()
end_document (Document name content) =
  writeFile name (renderAll content)