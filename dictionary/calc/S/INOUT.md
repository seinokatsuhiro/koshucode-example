# I/O List

- [../../dict.sh](#dictsh)
- ../../dict.sh [semidifference.k](#semidifferencek)
- ../../dict.sh [semijoin.k](#semijoink)
- ../../dict.sh [sixth-normal-form.k](#sixth-normal-formk)



## [../../dict.sh](../../dict.sh)

```
#!/bin/sh
dict_dir=`dirname $0`
koshu $dict_dir/DATA.k $*
```



## [semidifference.k](semidifference.k)

```
** -*- koshu -*-

s    : source S  /sno /sname /status /city
sp   : source SP /sno /pno /qty

ssp  : s | none ( meet sp )
ssp2 : s | none-meet sp

|== SSP  : ssp
|== SSP2 : ssp2

```

Command `../../dict.sh semidifference.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    semidifference.k
**
**  OUTPUT
**    <stdout>
**

|-- SSP  /sno 'S5  /sname 'Adams  /status 30  /city 'Athens

*** 1 judge 

|-- SSP2  /sno 'S5  /sname 'Adams  /status 30  /city 'Athens

*** 1 judge 

**
**  SUMMARY
**       1 judge  on SSP
**       1 judge  on SSP2
**       2 judges in total
**
```



## [semijoin.k](semijoin.k)

```
** -*- koshu -*-

s    : source S  /sno /sname /status /city
sp   : source SP /sno /pno /qty

ssp  : s | some ( meet sp )
ssp2 : s | some-meet sp

|== SSP  : ssp
|== SSP2 : ssp2

```

Command `../../dict.sh semijoin.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    semijoin.k
**
**  OUTPUT
**    <stdout>
**

|-- SSP  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- SSP  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- SSP  /sno 'S3  /sname 'Blake  /status 30  /city 'Paris
|-- SSP  /sno 'S4  /sname 'Clark  /status 20  /city 'London

*** 4 judges

|-- SSP2  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- SSP2  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- SSP2  /sno 'S3  /sname 'Blake  /status 30  /city 'Paris
|-- SSP2  /sno 'S4  /sname 'Clark  /status 20  /city 'London

*** 4 judges

**
**  SUMMARY
**       4 judges on SSP
**       4 judges on SSP2
**       8 judges in total
**
```



## [sixth-normal-form.k](sixth-normal-form.k)

```
** -*- koshu -*-

s        : source S  /sno /sname /status /city
s-sno    : s | pick /sno
s-sname  : s | pick /sno /sname
s-status : s | pick /sno /status
s-city   : s | pick /sno /city

|== S-SNO    : s-sno
|== S-SNAME  : s-sname
|== S-STATUS : s-status
|== S-CITY   : s-city

```

Command `../../dict.sh sixth-normal-form.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    sixth-normal-form.k
**
**  OUTPUT
**    <stdout>
**

|-- S-SNO  /sno 'S1
|-- S-SNO  /sno 'S2
|-- S-SNO  /sno 'S3
|-- S-SNO  /sno 'S4
|-- S-SNO  /sno 'S5

*** 5 judges

|-- S-SNAME  /sno 'S1  /sname 'Smith
|-- S-SNAME  /sno 'S2  /sname 'Jones
|-- S-SNAME  /sno 'S3  /sname 'Blake
|-- S-SNAME  /sno 'S4  /sname 'Clark
|-- S-SNAME  /sno 'S5  /sname 'Adams

*** 5 judges

|-- S-STATUS  /sno 'S1  /status 20
|-- S-STATUS  /sno 'S2  /status 10
|-- S-STATUS  /sno 'S3  /status 30
|-- S-STATUS  /sno 'S4  /status 20
|-- S-STATUS  /sno 'S5  /status 30

*** 5 judges

|-- S-CITY  /sno 'S1  /city 'London
|-- S-CITY  /sno 'S2  /city 'Paris
|-- S-CITY  /sno 'S3  /city 'Paris
|-- S-CITY  /sno 'S4  /city 'London
|-- S-CITY  /sno 'S5  /city 'Athens

*** 5 judges

**
**  SUMMARY
**       5 judges on S-CITY
**       5 judges on S-SNAME
**       5 judges on S-SNO
**       5 judges on S-STATUS
**      20 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
