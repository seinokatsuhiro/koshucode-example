# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [view.k](#viewk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [view.k](view.k)

```
** -*- koshu -*-

lsv : source S /sno /sname /status /city
    | keep /city = 'London

|== LSV : lsv

```

Command `../../dict.sh view.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    view.k
**

|-- LSV  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- LSV  /sno 'S4  /sname 'Clark  /status 20  /city 'London

*** 2 judges

**
**  SUMMARY
**       2 judges on LSV
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
