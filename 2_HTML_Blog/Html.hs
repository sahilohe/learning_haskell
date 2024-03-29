module Html
    (
      Html
	, Title
	, Structure
	, html_
	, p_
	, append_
	, h1_
	, render

	) where

newtype Html = Html String
newtype Structure = Structure String

type Title = String

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

getStructureString :: Structure -> String
getStructureString content = case content of
                            Structure str -> str

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    ( el "html"
      ( el "head" (el "title" title)
        <> el "body" (getStructureString content)
      )
    )

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

append_ :: Structure -> Structure -> Structure
append_ c1 c2 =
  Structure (getStructureString c1 <> getStructureString c2)

render :: Html -> String
render html =
  case html of
    Html str -> str
