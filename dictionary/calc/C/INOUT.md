# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [cardinality.k](#cardinalityk)
- ../../dict.sh [cartesian-product.k](#cartesian-productk)
- ../../dict.sh [commutative.k](#commutativek)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [cardinality.k](cardinality.k)

```
** -*- koshu -*-

s    : source S  /sno /sname /status /city
p    : source P  /pno /pname /color /weight /city
sp   : source SP /sno /pno /qty

|== CS  : s  | size /card
|== CP  : p  | size /card
|== CSP : sp | size /card
```

Command `../../dict.sh cardinality.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    cardinality.k
**

|-- CS  /card 5

*** 1 judge 

|-- CP  /card 6

*** 1 judge 

|-- CSP  /card 12

*** 1 judge 

**
**  SUMMARY
**       1 judge  on CP
**       1 judge  on CS
**       1 judge  on CSP
**       3 judges in total
**
```



## [cartesian-product.k](cartesian-product.k)

```
** -*- koshu -*-

s : source S /sno
p : source P /pno

|== S  : s
|== P  : p
|== SP : s | meet p
```

Command `../../dict.sh cartesian-product.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    cartesian-product.k
**

|-- S  /sno 'S1
|-- S  /sno 'S2
|-- S  /sno 'S3
|-- S  /sno 'S4
|-- S  /sno 'S5

*** 5 judges

|-- P  /pno 'P1
|-- P  /pno 'P2
|-- P  /pno 'P3
|-- P  /pno 'P4
|-- P  /pno 'P5

|-- P  /pno 'P6

*** 6 judges

|-- SP  /pno 'P6  /sno 'S1
|-- SP  /pno 'P5  /sno 'S1
|-- SP  /pno 'P4  /sno 'S1
|-- SP  /pno 'P3  /sno 'S1
|-- SP  /pno 'P2  /sno 'S1

|-- SP  /pno 'P1  /sno 'S1
|-- SP  /pno 'P6  /sno 'S2
|-- SP  /pno 'P5  /sno 'S2
|-- SP  /pno 'P4  /sno 'S2
|-- SP  /pno 'P3  /sno 'S2

|-- SP  /pno 'P2  /sno 'S2
|-- SP  /pno 'P1  /sno 'S2
|-- SP  /pno 'P6  /sno 'S3
|-- SP  /pno 'P5  /sno 'S3
|-- SP  /pno 'P4  /sno 'S3

|-- SP  /pno 'P3  /sno 'S3
|-- SP  /pno 'P2  /sno 'S3
|-- SP  /pno 'P1  /sno 'S3
|-- SP  /pno 'P6  /sno 'S4
|-- SP  /pno 'P5  /sno 'S4

|-- SP  /pno 'P4  /sno 'S4
|-- SP  /pno 'P3  /sno 'S4
|-- SP  /pno 'P2  /sno 'S4
|-- SP  /pno 'P1  /sno 'S4
|-- SP  /pno 'P6  /sno 'S5
*** 25

|-- SP  /pno 'P5  /sno 'S5
|-- SP  /pno 'P4  /sno 'S5
|-- SP  /pno 'P3  /sno 'S5
|-- SP  /pno 'P2  /sno 'S5
|-- SP  /pno 'P1  /sno 'S5

*** 30 judges

**
**  SUMMARY
**       6 judges on P
**       5 judges on S
**      30 judges on SP
**      41 judges in total
**
```



## [commutative.k](commutative.k)

```
** -*- koshu -*-

s     : source S  /sno /sname /status /city
sp    : source SP /sno /pno /qty

|== S-SP : s  | meet sp
|== SP-S : sp | meet s
```

Command `../../dict.sh commutative.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    commutative.k
**

|-- S-SP  /pno 'P6  /qty 100  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- S-SP  /pno 'P5  /qty 100  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- S-SP  /pno 'P4  /qty 200  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- S-SP  /pno 'P3  /qty 400  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- S-SP  /pno 'P2  /qty 200  /sno 'S1  /sname 'Smith  /status 20  /city 'London

|-- S-SP  /pno 'P1  /qty 300  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- S-SP  /pno 'P2  /qty 400  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- S-SP  /pno 'P1  /qty 300  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- S-SP  /pno 'P2  /qty 200  /sno 'S3  /sname 'Blake  /status 30  /city 'Paris
|-- S-SP  /pno 'P5  /qty 400  /sno 'S4  /sname 'Clark  /status 20  /city 'London

|-- S-SP  /pno 'P4  /qty 300  /sno 'S4  /sname 'Clark  /status 20  /city 'London
|-- S-SP  /pno 'P2  /qty 200  /sno 'S4  /sname 'Clark  /status 20  /city 'London

*** 12 judges

|-- SP-S  /sname 'Smith  /status 20  /city 'London  /sno 'S1  /pno 'P1  /qty 300
|-- SP-S  /sname 'Smith  /status 20  /city 'London  /sno 'S1  /pno 'P2  /qty 200
|-- SP-S  /sname 'Smith  /status 20  /city 'London  /sno 'S1  /pno 'P3  /qty 400
|-- SP-S  /sname 'Smith  /status 20  /city 'London  /sno 'S1  /pno 'P4  /qty 200
|-- SP-S  /sname 'Smith  /status 20  /city 'London  /sno 'S1  /pno 'P5  /qty 100

|-- SP-S  /sname 'Smith  /status 20  /city 'London  /sno 'S1  /pno 'P6  /qty 100
|-- SP-S  /sname 'Jones  /status 10  /city 'Paris  /sno 'S2  /pno 'P1  /qty 300
|-- SP-S  /sname 'Jones  /status 10  /city 'Paris  /sno 'S2  /pno 'P2  /qty 400
|-- SP-S  /sname 'Blake  /status 30  /city 'Paris  /sno 'S3  /pno 'P2  /qty 200
|-- SP-S  /sname 'Clark  /status 20  /city 'London  /sno 'S4  /pno 'P2  /qty 200

|-- SP-S  /sname 'Clark  /status 20  /city 'London  /sno 'S4  /pno 'P4  /qty 300
|-- SP-S  /sname 'Clark  /status 20  /city 'London  /sno 'S4  /pno 'P5  /qty 400

*** 12 judges

**
**  SUMMARY
**      12 judges on S-SP
**      12 judges on SP-S
**      24 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
