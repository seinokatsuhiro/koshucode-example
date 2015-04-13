# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [union.k](#unionk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [union.k](union.k)

```
** -*- koshu -*-

**  classical set union

s-city : source S /city
p-city : source P /city

|== CITY1 : s-city | join p-city

**  join of relational lattice

s      : source S /sno /sname /status /city
p      : source P /pno /pname /color /weight /city

|== CITY2 : s | join p

```

Command `../../dict.sh union.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    union.k
**
**  OUTPUT
**    <stdout>
**

|-- CITY1  /city 'London
|-- CITY1  /city 'Paris
|-- CITY1  /city 'Athens
|-- CITY1  /city 'Oslo

*** 4 judges

|-- CITY2  /city 'London
|-- CITY2  /city 'Paris
|-- CITY2  /city 'Athens
|-- CITY2  /city 'Oslo

*** 4 judges

**
**  SUMMARY
**       4 judges on CITY1
**       4 judges on CITY2
**       8 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
