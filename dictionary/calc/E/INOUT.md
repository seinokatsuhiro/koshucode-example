# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [empty-heading.k](#empty-headingk)
- ../../dict.sh [empty.k](#emptyk)
- ../../dict.sh [extension.k](#extensionk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [empty-heading.k](empty-heading.k)

```
** -*- koshu -*-

|== EMPTY-HEADING : dee

```

Command `../../dict.sh empty-heading.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    empty-heading.k
**

|-- EMPTY-HEADING

*** 1 judge 

**
**  SUMMARY
**       1 judge  on EMPTY-HEADING
**       1 judge  in total
**
```



## [empty.k](empty.k)

```
** -*- koshu -*-

s : source S  /sno /sname /status /city

|== EMPTY-SIZE : s | size /size
|== EMPTY-ZERO : s | empty | size /size

```

Command `../../dict.sh empty.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    empty.k
**

|-- EMPTY-SIZE  /size 5

*** 1 judge 

|-- EMPTY-ZERO  /size 0

*** 1 judge 

**
**  SUMMARY
**       1 judge  on EMPTY-SIZE
**       1 judge  on EMPTY-ZERO
**       2 judges in total
**
```



## [extension.k](extension.k)

```
** -*- koshu -*-

p    : source P  /pno /pname /color /weight /city
p2   : p | add /gmwt ( /weight * 454 )

|== P : p2

```

Command `../../dict.sh extension.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    extension.k
**

|-- P  /gmwt 5 448  /pno 'P1  /pname 'Nut  /color 'Red  /weight 12  /city 'London
|-- P  /gmwt 7 718  /pno 'P2  /pname 'Bolt  /color 'Green  /weight 17  /city 'Paris
|-- P  /gmwt 7 718  /pno 'P3  /pname 'Screw  /color 'Blue  /weight 17  /city 'Oslo
|-- P  /gmwt 6 356  /pno 'P4  /pname 'Screw  /color 'Red  /weight 14  /city 'London
|-- P  /gmwt 5 448  /pno 'P5  /pname 'Cam  /color 'Blue  /weight 12  /city 'Paris

|-- P  /gmwt 8 626  /pno 'P6  /pname 'Cog  /color 'Red  /weight 19  /city 'London

*** 6 judges

**
**  SUMMARY
**       6 judges on P
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
