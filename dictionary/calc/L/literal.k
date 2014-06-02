** -*- koshu -*-

|-- INTEGER   /lit 4
|-- INTEGER   /lit -5

|-- CHAR      /lit 'ABC
|-- CHAR      /lit "ABC DEF"
|-- CHAR      /lit <qq> "I am double quoted." <qq>

|-- BOOLEAN   /lit <1>
|-- BOOLEAN   /lit <0>

|-- SET       /lit { }
|-- SET       /lit { 'ABC }
|-- SET       /lit { 'ABC : 'DEF : () : () } ** empties are omitted
|-- SET       /lit { 'ABC : 'DEF : { 'G : 'HI }}

|-- LIST      /lit [ ]
|-- LIST      /lit [ 'ABC ]
|-- LIST      /lit [ 'ABC : 'DEF : () : () ]
|-- LIST      /lit [ 'ABC : 'DEF : [ 'G : 'HI ]]

|-- TERMSET   /lit << /sno 'S1  /pno 'P1  /qty 300 >>
|-- TERMSET   /lit << /sno 'S1  /pno 'P2  /qty 200 >>
|-- TERMSET   /lit << /sno 'S1 >>
|-- TERMSET   /lit << >>

|-- RELATION  /lit {| /sno : /pno : /qty
                    | 'S1  : 'P1  : 300
                    | 'S1  : 'P2  : 200 |}
|-- RELATION  /lit {| /sno : /pno : /qty
                    | 'S1  : 'P1  : 300 |}
|-- RELATION  /lit {| /sno : /pno : /qty |} ** empty relation
|-- RELATION  /lit {| /sno : /pno : /qty | () : () : () |} ** singleton relation
|-- RELATION  /lit {| /sno | () |}
|-- RELATION  /lit {| |}        ** reldum
|-- RELATION  /lit {| | |}      ** reldee
|-- RELATION  /lit {| | | |}    ** reldee

|== INTEGER  : source INTEGER  /lit
|== CHAR     : source CHAR     /lit
|== BOOLEAN  : source BOOLEAN  /lit
|== SET      : source SET      /lit
|== LIST     : source LIST     /lit
|== TERMSET  : source TERMSET  /lit
|== RELATION : source RELATION /lit

