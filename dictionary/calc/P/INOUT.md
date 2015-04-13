# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [projection.k](#projectionk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [projection.k](projection.k)

```
** -*- koshu -*-

s    : source S  /sno /sname /status /city

sp   : s | pick /status /city
sc   : s | cut  /status /city

|== SP : sp
|== SC : sc

```

Command `../../dict.sh projection.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    projection.k
**
**  OUTPUT
**    <stdout>
**

|-- SP  /status 20  /city 'London
|-- SP  /status 10  /city 'Paris
|-- SP  /status 30  /city 'Paris
|-- SP  /status 30  /city 'Athens

*** 4 judges

|-- SC  /sno 'S1  /sname 'Smith
|-- SC  /sno 'S2  /sname 'Jones
|-- SC  /sno 'S3  /sname 'Blake
|-- SC  /sno 'S4  /sname 'Clark
|-- SC  /sno 'S5  /sname 'Adams

*** 5 judges

**
**  SUMMARY
**       5 judges on SC
**       4 judges on SP
**       9 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
