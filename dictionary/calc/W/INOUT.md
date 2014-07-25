# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [with.k](#withk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [with.k](with.k)

```
** -*- koshu -*-

s    : source S  /sno
sp   : source SP /sno /pno /qty

tx   : s  | rename /sx /sno
ty   : s  | rename /sy /sno
txy  : tx | meet ty

|== TXY : txy

```

Command `../../dict.sh with.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    with.k
**

|-- TXY  /sy 'S1  /sx 'S1
|-- TXY  /sy 'S2  /sx 'S1
|-- TXY  /sy 'S3  /sx 'S1
|-- TXY  /sy 'S4  /sx 'S1
|-- TXY  /sy 'S5  /sx 'S1

|-- TXY  /sy 'S1  /sx 'S2
|-- TXY  /sy 'S2  /sx 'S2
|-- TXY  /sy 'S3  /sx 'S2
|-- TXY  /sy 'S4  /sx 'S2
|-- TXY  /sy 'S5  /sx 'S2

|-- TXY  /sy 'S1  /sx 'S3
|-- TXY  /sy 'S2  /sx 'S3
|-- TXY  /sy 'S3  /sx 'S3
|-- TXY  /sy 'S4  /sx 'S3
|-- TXY  /sy 'S5  /sx 'S3

|-- TXY  /sy 'S1  /sx 'S4
|-- TXY  /sy 'S2  /sx 'S4
|-- TXY  /sy 'S3  /sx 'S4
|-- TXY  /sy 'S4  /sx 'S4
|-- TXY  /sy 'S5  /sx 'S4

|-- TXY  /sy 'S1  /sx 'S5
|-- TXY  /sy 'S2  /sx 'S5
|-- TXY  /sy 'S3  /sx 'S5
|-- TXY  /sy 'S4  /sx 'S5
|-- TXY  /sy 'S5  /sx 'S5

*** 25 judges

**
**  SUMMARY
**      25 judges on TXY
**      25 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
