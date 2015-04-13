# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [identity-projection.k](#identity-projectionk)
- ../../dict.sh [identity-restriction.k](#identity-restrictionk)
- ../../dict.sh [intersection.k](#intersectionk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [identity-projection.k](identity-projection.k)

```
** -*- koshu -*-

sp   : source SP /sno /pno /qty
sp2  : sp | pick /sno /pno /qty

|== SP2 : sp2

```

Command `../../dict.sh identity-projection.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    identity-projection.k
**
**  OUTPUT
**    <stdout>
**

|-- SP2  /sno 'S1  /pno 'P1  /qty 300
|-- SP2  /sno 'S1  /pno 'P2  /qty 200
|-- SP2  /sno 'S1  /pno 'P3  /qty 400
|-- SP2  /sno 'S1  /pno 'P4  /qty 200
|-- SP2  /sno 'S1  /pno 'P5  /qty 100

|-- SP2  /sno 'S1  /pno 'P6  /qty 100
|-- SP2  /sno 'S2  /pno 'P1  /qty 300
|-- SP2  /sno 'S2  /pno 'P2  /qty 400
|-- SP2  /sno 'S3  /pno 'P2  /qty 200
|-- SP2  /sno 'S4  /pno 'P2  /qty 200

|-- SP2  /sno 'S4  /pno 'P4  /qty 300
|-- SP2  /sno 'S4  /pno 'P5  /qty 400

*** 12 judges

**
**  SUMMARY
**      12 judges on SP2
**      12 judges in total
**
```



## [identity-restriction.k](identity-restriction.k)

```
** -*- koshu -*-

s : source S /sno /sname /status /city

|== S2 : s | omit /status = 25
|== S3 : s | keep /status = /status

```

Command `../../dict.sh identity-restriction.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    identity-restriction.k
**
**  OUTPUT
**    <stdout>
**

|-- S2  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- S2  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- S2  /sno 'S3  /sname 'Blake  /status 30  /city 'Paris
|-- S2  /sno 'S4  /sname 'Clark  /status 20  /city 'London
|-- S2  /sno 'S5  /sname 'Adams  /status 30  /city 'Athens

*** 5 judges

|-- S3  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- S3  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- S3  /sno 'S3  /sname 'Blake  /status 30  /city 'Paris
|-- S3  /sno 'S4  /sname 'Clark  /status 20  /city 'London
|-- S3  /sno 'S5  /sname 'Adams  /status 30  /city 'Athens

*** 5 judges

**
**  SUMMARY
**       5 judges on S2
**       5 judges on S3
**      10 judges in total
**
```



## [intersection.k](intersection.k)

```
** -*- koshu -*-

s    : source S  /city
p    : source P  /city

|== S : s
|== P : p
|== I : s | meet p

```

Command `../../dict.sh intersection.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    intersection.k
**
**  OUTPUT
**    <stdout>
**

|-- S  /city 'London
|-- S  /city 'Paris
|-- S  /city 'Athens

*** 3 judges

|-- P  /city 'London
|-- P  /city 'Paris
|-- P  /city 'Oslo

*** 3 judges

|-- I  /city 'London
|-- I  /city 'Paris

*** 2 judges

**
**  SUMMARY
**       2 judges on I
**       3 judges on P
**       3 judges on S
**       8 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
