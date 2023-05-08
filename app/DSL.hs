module DSL where

import Types

(&) :: Document -> Tag -> Document
(&) (Document name content) tag = Document name (content ++ [tag])

(#) :: Document -> String -> Document
(#) doc str = doc & (Heading 1 str)

(##) doc str = doc & (Heading 2 str)

(###) doc str = doc & (Heading 3 str)

(####) doc str = doc & (Heading 4 str)

(#####) doc str = doc & (Heading 5 str)

(######) doc str = doc & (Heading 6 str)

(§) doc str = doc & (Paragraph str)

img doc url = doc & Image url