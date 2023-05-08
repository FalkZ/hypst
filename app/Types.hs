module Types where

data Tag
  = Heading Integer String
  | Paragraph String
  | Image String

data Document = Document
  { name :: String,
    content :: [Tag]
  }

document name = Document name []