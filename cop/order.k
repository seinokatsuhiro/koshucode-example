** -*- koshu -*-
**
**  DESCRIPTION
**    Examples for Koshucode.Baala.Vanilla.Cop.Order
**
**  USAGE
**    koshu order.k
**


** *********************************  Integer

|-- INT  /a 2  /b 2
|-- INT  /a 0  /b 5
|-- INT  /a 3  /b 0

int : source INT /a /b

|== INT-A
  | int
  | add /eq ( /a = /b )
        /gt ( /a > /b )
        /lt ( /a < /b )

|== INT-B
  | int
  | add /neq ( /a <> /b )
        /lte ( /a <= /b )
        /gte ( /a >= /b )


** *********************************  Text

|-- TEXT  /a 'apple  /b 'apple
|-- TEXT  /a 'apple  /b 'banana
|-- TEXT  /a 'cocoa  /b 'banana

text : source TEXT /a /b

|== TEXT-A
  | text
  | add /eq ( /a = /b )
        /gt ( /a > /b )
        /lt ( /a < /b )

|== TEXT-B
  | text
  | add /neq ( /a <> /b )
        /lte ( /a <= /b )
        /gte ( /a >= /b )

