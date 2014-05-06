# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [quota-query.k](#quota-queryk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [quota-query.k](quota-query.k)

```
** -*- koshu -*-

p     : source P  /pno /pname /color /weight /city
pw    : p | rank /w -order /weight
pq    : pw | keep /w <= 3 | cut /w

|== P : pq

```

Command `../../dict.sh quota-query.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    quota-query.k
**

|-- P  /pno 'P1  /pname 'Nut  /color 'Red  /weight 12  /city 'London
|-- P  /pno 'P5  /pname 'Cam  /color 'Blue  /weight 12  /city 'Paris
|-- P  /pno 'P4  /pname 'Screw  /color 'Red  /weight 14  /city 'London
|-- P  /pno 'P2  /pname 'Bolt  /color 'Green  /weight 17  /city 'Paris
|-- P  /pno 'P3  /pname 'Screw  /color 'Blue  /weight 17  /city 'Oslo

*** 5 judges

**
**  SUMMARY
**       5 judges on P
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
