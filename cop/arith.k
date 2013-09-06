** -*- koshu -*-
**
**  DESCRIPTION
**    Examples for Koshucode.Baala.Vanilla.Cop.Arith
**
**  USAGE
**    koshu arith.k
**

|-- INT  /a 2
|-- INT  /a -3

a : source INT /a

|== A : a
|== B : a | add /add   ( /a + 10 )
                /minus ( /a - 10 )
                /mult  ( /a * 3 )
                /abs   ( abs /a )

|== C : a | add /add ( + /a 1 /a 2)
|== D : a | add /abs ( abs /a )

