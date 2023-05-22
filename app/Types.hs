module Types where

data Tag
  = Heading Integer String
  | Paragraph String
  | Image String
  | UnorderedList String
  | Blockquote String
  | Style String
  | Include Document
  | Input Document


data Document = Document
  { name :: String,
    content :: [Tag]
  }

document name = Document name []