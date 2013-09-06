** -*- koshu -*-
**
**  DESCRIPTION
**    Examples for Koshucode.Baala.Vanilla.Cop.Logic
**
**  USAGE
**    koshu logic.k
**

|-- BOOLEAN  /x #true
|-- BOOLEAN  /x #false

bool : source BOOLEAN /x

a : bool | rename /a /x
b : bool | rename /b /x
c : a | meet b

|== C : c

|== D
  | c
  | add /and ( /a and /b )
        /or  ( /a or /b )
        /not ( not /a )

|== E
  | add ** /and0 ( and )
        /and1 ( and #true )
        /and2 ( and #true #true )
        /and3 ( and #true #true #true )

|== G
  | bool
  | add /y ( if /x 'yes 'no )

