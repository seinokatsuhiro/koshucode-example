# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [natural-join.k](#natural-joink)
- ../../dict.sh [negation.k](#negationk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [natural-join.k](natural-join.k)

```
** -*- koshu -*-

s    : source S  /sno /sname /status /city
sp   : source SP /sno /pno /qty

ssp  : s | meet sp

|== SSP : ssp

```

Command `../../dict.sh natural-join.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    natural-join.k
**

|-- SSP  /pno 'P6  /qty 100  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- SSP  /pno 'P5  /qty 100  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- SSP  /pno 'P4  /qty 200  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- SSP  /pno 'P3  /qty 400  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- SSP  /pno 'P2  /qty 200  /sno 'S1  /sname 'Smith  /status 20  /city 'London

|-- SSP  /pno 'P1  /qty 300  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- SSP  /pno 'P2  /qty 400  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- SSP  /pno 'P1  /qty 300  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- SSP  /pno 'P2  /qty 200  /sno 'S3  /sname 'Blake  /status 30  /city 'Paris
|-- SSP  /pno 'P5  /qty 400  /sno 'S4  /sname 'Clark  /status 20  /city 'London

|-- SSP  /pno 'P4  /qty 300  /sno 'S4  /sname 'Clark  /status 20  /city 'London
|-- SSP  /pno 'P2  /qty 200  /sno 'S4  /sname 'Clark  /status 20  /city 'London

*** 12 judges

**
**  SUMMARY
**      12 judges on SSP
**      12 judges in total
**
```



## [negation.k](negation.k)

```
** -*- koshu -*-

|== S -fore /sno /city
  | source S /sno /city
  | add /criteria ( /city = 'London )
  | add /negation ( not /criteria )

```

Command `../../dict.sh negation.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    negation.k
**

|-- S  /sno 'S1  /city 'London  /negation #false  /criteria #true
|-- S  /sno 'S2  /city 'Paris  /negation #true  /criteria #false
|-- S  /sno 'S3  /city 'Paris  /negation #true  /criteria #false
|-- S  /sno 'S4  /city 'London  /negation #false  /criteria #true
|-- S  /sno 'S5  /city 'Athens  /negation #true  /criteria #false

*** 5 judges

**
**  SUMMARY
**       5 judges on S
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
