# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [relation-valued-attribute.k](#relation-valued-attributek)
- ../../dict.sh [renaming.k](#renamingk)
- ../../dict.sh [repeating-group.k](#repeating-groupk)
- ../../dict.sh [restriction.k](#restrictionk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [relation-valued-attribute.k](relation-valued-attribute.k)

```
** -*- koshu -*-

|-- A  /r {| /a  : /b
           | 'A1 : 10
           | 'A2 : 20
           | 'A3 : 30
           |}

|-- A  /r {| /a  : /b
           | 'A4 : 10
           | 'A5 : 20
           |}

|== A
  | source A /r
  | add /size ( length /r )
  --table
```

Command `../../dict.sh relation-valued-attribute.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    relation-valued-attribute.k
**

|-- A  /size 3  /r {| /a : /b | 'A1 : 10 | 'A2 : 20 | 'A3 : 30 |}
|-- A  /size 2  /r {| /a : /b | 'A4 : 10 | 'A5 : 20 |}

*** 2 judges

**  TABLE : A
**
**    /size /r
**    ----- ------
**    3     /a /b
**          -- --
**          'A1 10
**          'A2 20
**          'A3 30
**          
**    2     /a /b
**          -- --
**          'A4 10
**          'A5 20
**          

**
**  SUMMARY
**       2 judges on A
**       2 judges in total
**
```



## [renaming.k](renaming.k)

```
** -*- koshu -*-

p    : source P  /pno /pname /color /weight /city
p2   : p | rename /wt  /weight
                  /col /color

|== P2 : p2

```

Command `../../dict.sh renaming.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    renaming.k
**

|-- P2  /pno 'P1  /pname 'Nut  /col 'Red  /wt 12  /city 'London
|-- P2  /pno 'P2  /pname 'Bolt  /col 'Green  /wt 17  /city 'Paris
|-- P2  /pno 'P3  /pname 'Screw  /col 'Blue  /wt 17  /city 'Oslo
|-- P2  /pno 'P4  /pname 'Screw  /col 'Red  /wt 14  /city 'London
|-- P2  /pno 'P5  /pname 'Cam  /col 'Blue  /wt 12  /city 'Paris

|-- P2  /pno 'P6  /pname 'Cog  /col 'Red  /wt 19  /city 'London

*** 6 judges

**
**  SUMMARY
**       6 judges on P2
**       6 judges in total
**
```



## [repeating-group.k](repeating-group.k)

```
** -*- koshu -*-

p    : source P  /pno /pname
sp   : source SP /sno /pno /qty

pno  : sp
     | pick /pno
     | group /r sp
     | add /qty-list  ( /r/qty )
           /qty-total ( total /r/qty )
     | cut /r
     | meet p

|== P : pno

```

Command `../../dict.sh repeating-group.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    repeating-group.k
**

|-- P  /pname 'Nut  /qty-list [ 300 : 300 ]  /qty-total 600  /pno 'P1
|-- P  /pname 'Bolt  /qty-list [ 200 : 200 : 400 : 200 ]  /qty-total 1 000  /pno 'P2
|-- P  /pname 'Screw  /qty-list [ 400 ]  /qty-total 400  /pno 'P3
|-- P  /pname 'Screw  /qty-list [ 300 : 200 ]  /qty-total 500  /pno 'P4
|-- P  /pname 'Cam  /qty-list [ 400 : 100 ]  /qty-total 500  /pno 'P5

|-- P  /pname 'Cog  /qty-list [ 100 ]  /qty-total 100  /pno 'P6

*** 6 judges

**
**  SUMMARY
**       6 judges on P
**       6 judges in total
**
```



## [restriction.k](restriction.k)

```
** -*- koshu -*-

p    : source P  /pno /pname /color /weight /city
p2   : p | keep /weight = 17
           and  /city   = 'Paris

|== P2 : p2

```

Command `../../dict.sh restriction.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    restriction.k
**

|-- P2  /pno 'P2  /pname 'Bolt  /color 'Green  /weight 17  /city 'Paris

*** 1 judge 

**
**  SUMMARY
**       1 judge  on P2
**       1 judge  in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
