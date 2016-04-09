# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [literal.k](#literalk)
- ../../dict.sh [lossy-decomposition.k](#lossy-decompositionk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [literal.k](literal.k)

```
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
|-- SET       /lit { 'ABC | 'DEF | () | () } ** empties are omitted
|-- SET       /lit { 'ABC | 'DEF | { 'G | 'HI }}

|-- LIST      /lit [ ]
|-- LIST      /lit [ 'ABC ]
|-- LIST      /lit [ 'ABC | 'DEF | () | () ]
|-- LIST      /lit [ 'ABC | 'DEF | [ 'G | 'HI ]]

|-- TERMSET   /lit << /sno 'S1  /pno 'P1  /qty 300 >>
|-- TERMSET   /lit << /sno 'S1  /pno 'P2  /qty 200 >>
|-- TERMSET   /lit << /sno 'S1 >>
|-- TERMSET   /lit << >>

|-- RELATION  /lit {= /sno /pno /qty
                    [ 'S1  | 'P1  | 300 ]
                    [ 'S1  | 'P2  | 200 ] =}
|-- RELATION  /lit {= /sno /pno /qty
                    [ 'S1  | 'P1  | 300 ] =}
|-- RELATION  /lit {= /sno /pno /qty =} ** empty relation
|-- RELATION  /lit {= /sno /pno /qty [ () | () | () ] =} ** singleton relation
|-- RELATION  /lit {= /sno [ () ] =}
|-- RELATION  /lit {= =}         ** reldum
|-- RELATION  /lit {= [] =}      ** reldee
|-- RELATION  /lit {= [] [] =}   ** reldee

|== INTEGER  : source INTEGER  /lit
|== CHAR     : source CHAR     /lit
|== BOOLEAN  : source BOOLEAN  /lit
|== SET      : source SET      /lit
|== LIST     : source LIST     /lit
|== TERMSET  : source TERMSET  /lit
|== RELATION : source RELATION /lit

```

Command `../../dict.sh literal.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    literal.k
**
**  OUTPUT
**    <stdout>
**

|-- INTEGER  /lit 4
|-- INTEGER  /lit -5

*** 2 judges

|-- CHAR  /lit 'ABC
|-- CHAR  /lit "ABC DEF"
|-- CHAR  /lit <qq> "I am double quoted." <qq>

*** 3 judges

|-- BOOLEAN  /lit (+)
|-- BOOLEAN  /lit (-)

*** 2 judges

|-- SET  /lit { }
|-- SET  /lit { 'ABC }
|-- SET  /lit { 'ABC | 'DEF }
|-- SET  /lit { 'ABC | 'DEF | { 'G | 'HI } }

*** 4 judges

|-- LIST  /lit [ ]
|-- LIST  /lit [ 'ABC ]
|-- LIST  /lit [ 'ABC | 'DEF | () | () ]
|-- LIST  /lit [ 'ABC | 'DEF | [ 'G | 'HI ] ]

*** 4 judges

|-- TERMSET  /lit << /sno 'S1 /pno 'P1 /qty 300 >>
|-- TERMSET  /lit << /sno 'S1 /pno 'P2 /qty 200 >>
|-- TERMSET  /lit << /sno 'S1 >>
|-- TERMSET  /lit << >>

*** 4 judges

|-- RELATION  /lit {= /sno /pno /qty [ 'S1 | 'P1 | 300 ] [ 'S1 | 'P2 | 200 ] =}
|-- RELATION  /lit {= /sno /pno /qty [ 'S1 | 'P1 | 300 ] =}
|-- RELATION  /lit {= /sno /pno /qty =}
|-- RELATION  /lit {= /sno /pno /qty [ () | () | () ] =}
|-- RELATION  /lit {= /sno [ () ] =}

|-- RELATION  /lit {= =}
|-- RELATION  /lit {= [ ] =}

*** 7 judges

**
**  SUMMARY
**       2 judges on BOOLEAN
**       3 judges on CHAR
**       2 judges on INTEGER
**       4 judges on LIST
**       7 judges on RELATION
**       4 judges on SET
**       4 judges on TERMSET
**      26 judges in total
**
```



## [lossy-decomposition.k](lossy-decomposition.k)

```
** -*- koshu -*-

s1    : source S  /sno /sname
s2    : source S       /sname /status /city

|== S3 : s1 | meet s2

```

Command `../../dict.sh lossy-decomposition.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    lossy-decomposition.k
**
**  OUTPUT
**    <stdout>
**

|-- S3  /status 20  /city 'London  /sno 'S1  /sname 'Smith
|-- S3  /status 10  /city 'Paris  /sno 'S2  /sname 'Jones
|-- S3  /status 30  /city 'Paris  /sno 'S3  /sname 'Blake
|-- S3  /status 20  /city 'London  /sno 'S4  /sname 'Clark
|-- S3  /status 30  /city 'Athens  /sno 'S5  /sname 'Adams

*** 5 judges

**
**  SUMMARY
**       5 judges on S3
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
