** -*- koshu -*-
**
**  DESCRIPTION
**    Examples for Koshucode.Baala.Vanilla.Cop.List
**
**  USAGE
**    koshu list.k
**

|-- DEC   /a [ 1 : 2 : 3 ]
|-- TEXT  /a [ 'a : 'b : 'c ]

dec  : source DEC /a
text : source TEXT /a

|== DEC  : dec
|== TEXT : text

|== A
  | dec
  | add /length  ( length /a )
        /min     ( min /a )
        /max     ( max /a )
        /total   ( total /a )

|== B
  | text
  | add /length  ( length /a )
        /min     ( min /a )
        /max     ( max /a )

|== C
  | add /list    ( list ('a) ('b) ('c) )
        /length  ( length ('abc) )

|== D
  | add /list-a  [ 1 : 2 ]
        /list-b  [ 2 : 3 : 4 ]
        /set-a   { 1 : 2 }
        /set-b   { 2 : 3 : 4 }
  | add /list-union      ( /list-a ++ /list-b )
        /set-union       ( /set-a  ++ /set-b )
        /list-intersect  ( /list-a  intersect  /list-b )
        /set-intersect   ( /set-a   intersect  /set-b )
        /list-minus      ( /list-a  minus  /list-b )
        /set-minus       ( /set-a   minus  /set-b )
  | cut /list-a /list-b
        /set-a  /set-b

|== F
  | add /a 'aa
        /b 'bb
        /c 'cc
  | add /d ( /a ++ /b ++ /c )

