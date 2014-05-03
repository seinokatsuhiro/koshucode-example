# I/O List

- [../../dict.sh](#//dictsh)
- ../../dict.sh [associative.k](#associativek)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [associative.k](associative.k)

```
** -*- koshu -*-

s     : source S  /sno /sname
p     : source P  /pno /pname
sp    : source SP /sno /pno /qty

|== LEFT  : (sp | meet s) | meet p
|== RIGHT :  sp | meet (s | meet p)
```

Command `../../dict.sh associative.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    associative.k
**

|-- LEFT  /pname 'Nut  /sname 'Smith  /sno 'S1  /pno 'P1  /qty 300
|-- LEFT  /pname 'Bolt  /sname 'Smith  /sno 'S1  /pno 'P2  /qty 200
|-- LEFT  /pname 'Screw  /sname 'Smith  /sno 'S1  /pno 'P3  /qty 400
|-- LEFT  /pname 'Screw  /sname 'Smith  /sno 'S1  /pno 'P4  /qty 200
|-- LEFT  /pname 'Cam  /sname 'Smith  /sno 'S1  /pno 'P5  /qty 100

|-- LEFT  /pname 'Cog  /sname 'Smith  /sno 'S1  /pno 'P6  /qty 100
|-- LEFT  /pname 'Nut  /sname 'Jones  /sno 'S2  /pno 'P1  /qty 300
|-- LEFT  /pname 'Bolt  /sname 'Jones  /sno 'S2  /pno 'P2  /qty 400
|-- LEFT  /pname 'Bolt  /sname 'Blake  /sno 'S3  /pno 'P2  /qty 200
|-- LEFT  /pname 'Bolt  /sname 'Clark  /sno 'S4  /pno 'P2  /qty 200

|-- LEFT  /pname 'Screw  /sname 'Clark  /sno 'S4  /pno 'P4  /qty 300
|-- LEFT  /pname 'Cam  /sname 'Clark  /sno 'S4  /pno 'P5  /qty 400

*** 12 judges

|-- RIGHT  /pname 'Nut  /sname 'Smith  /sno 'S1  /pno 'P1  /qty 300
|-- RIGHT  /pname 'Bolt  /sname 'Smith  /sno 'S1  /pno 'P2  /qty 200
|-- RIGHT  /pname 'Screw  /sname 'Smith  /sno 'S1  /pno 'P3  /qty 400
|-- RIGHT  /pname 'Screw  /sname 'Smith  /sno 'S1  /pno 'P4  /qty 200
|-- RIGHT  /pname 'Cam  /sname 'Smith  /sno 'S1  /pno 'P5  /qty 100

|-- RIGHT  /pname 'Cog  /sname 'Smith  /sno 'S1  /pno 'P6  /qty 100
|-- RIGHT  /pname 'Nut  /sname 'Jones  /sno 'S2  /pno 'P1  /qty 300
|-- RIGHT  /pname 'Bolt  /sname 'Jones  /sno 'S2  /pno 'P2  /qty 400
|-- RIGHT  /pname 'Bolt  /sname 'Blake  /sno 'S3  /pno 'P2  /qty 200
|-- RIGHT  /pname 'Bolt  /sname 'Clark  /sno 'S4  /pno 'P2  /qty 200

|-- RIGHT  /pname 'Screw  /sname 'Clark  /sno 'S4  /pno 'P4  /qty 300
|-- RIGHT  /pname 'Cam  /sname 'Clark  /sno 'S4  /pno 'P5  /qty 400

*** 12 judges

**
**  SUMMARY
**      12 judges on LEFT
**      12 judges on RIGHT
**      24 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
