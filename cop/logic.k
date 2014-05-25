** -*- koshu -*-
**
**  DESCRIPTION
**    Examples for Koshucode.Baala.Vanilla.Cop.Logic
**
**  USAGE
**    koshu logic.k
**

|-- BOOLEAN  /x <1>
|-- BOOLEAN  /x <0>

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
        /and1 ( and <1> )
        /and2 ( and <1> <1> )
        /and3 ( and <1> <1> <1> )

|== G
  | bool
  | add /y ( if /x 'yes 'no )

