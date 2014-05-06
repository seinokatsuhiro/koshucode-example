# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [delete.k](#deletek)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [delete.k](delete.k)

```
** -*- koshu -*-

|=X S
  | source S /sno /city
  | keep /city = 'Athens
```

Command `../../dict.sh delete.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    delete.k
**

|-X S  /sno 'S5  /city 'Athens

*** 1 judge 

**
**  SUMMARY
**       1 judge  on S
**       1 judge  in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
