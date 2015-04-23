# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [table-dee.k](#table-deek)
- ../../dict.sh [table-dum.k](#table-dumk)
- ../../dict.sh [theta-join.k](#theta-joink)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [table-dee.k](table-dee.k)

```
** -*- koshu -*-

s    : source S /sno /sname /status /city
sj   : s | join dee
sm   : s | meet dee

|== DEE : dee
|== SJ  : sj
|== SM  : sm

```

Command `../../dict.sh table-dee.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    table-dee.k
**
**  OUTPUT
**    <stdout>
**

|-- DEE

*** 1 judge 

|-- SJ

*** 1 judge 

|-- SM  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- SM  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- SM  /sno 'S3  /sname 'Blake  /status 30  /city 'Paris
|-- SM  /sno 'S4  /sname 'Clark  /status 20  /city 'London
|-- SM  /sno 'S5  /sname 'Adams  /status 30  /city 'Athens

*** 5 judges

**
**  SUMMARY
**       1 judge  on DEE
**       1 judge  on SJ
**       5 judges on SM
**       7 judges in total
**
```



## [table-dum.k](table-dum.k)

```
** -*- koshu -*-

s    : source S /sno /sname /status /city
sj   : s | join dum
sm   : s | meet dum

|== DUM : dum
|== SJ  : sj
|== SM  : sm

```

Command `../../dict.sh table-dum.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    table-dum.k
**
**  OUTPUT
**    <stdout>
**

*** no judges

|-- SJ

*** 1 judge 

*** no judges

**
**  SUMMARY
**      no judges on DUM
**       1 judge  on SJ
**      no judges on SM
**       1 judge  in total
**
```



## [theta-join.k](theta-join.k)

```
** -*- koshu -*-

s    : source S  /city | rename /sc /city
p    : source P  /city | rename /pc /city

sp   : s | meet p
         | keep /sc > /pc

|== S  : s
|== P  : p
|== SP : sp

```

Command `../../dict.sh theta-join.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    theta-join.k
**
**  OUTPUT
**    <stdout>
**

|-- S  /sc 'London
|-- S  /sc 'Paris
|-- S  /sc 'Athens

*** 3 judges

|-- P  /pc 'London
|-- P  /pc 'Paris
|-- P  /pc 'Oslo

*** 3 judges

|-- SP  /pc 'London  /sc 'Paris
|-- SP  /pc 'Oslo  /sc 'Paris

*** 2 judges

**
**  SUMMARY
**       3 judges on P
**       3 judges on S
**       2 judges on SP
**       8 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
