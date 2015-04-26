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
**
**  Get pairs of supplier numbers, /sx and /sy say, such that
**  /sx and /sy each supply exactly the same set of parts.
**

|-- SP  /sno 'S3  /pno 'P1  /qty 200

s    : source S  /sno
sp   : source SP /sno /pno /qty

tx   : s  | rename /sx /sno
ty   : s  | rename /sy /sno
txy  : tx | meet ty

spx  : sp  | rename /sx /sno
spy  : sp  | rename /sy /sno
spxy : txy | some same-parts

same-parts
     : group /spx spx
     | group /spy spy
     | for /spx ( pick /pno )
     | for /spy ( pick /pno )
     | keep /spx = /spy

|== SUPPLY-SAME-PARTS : spxy

|== PARTS-CONTENTS : txy | meet same-parts
  --table --forward /sx /sy

```

Command `../../dict.sh with.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../../DATA.k
**    with.k
**
**  OUTPUT
**    <stdout>
**

|-- SUPPLY-SAME-PARTS  /sy 'S1  /sx 'S1
|-- SUPPLY-SAME-PARTS  /sy 'S2  /sx 'S2
|-- SUPPLY-SAME-PARTS  /sy 'S3  /sx 'S2
|-- SUPPLY-SAME-PARTS  /sy 'S2  /sx 'S3
|-- SUPPLY-SAME-PARTS  /sy 'S3  /sx 'S3

|-- SUPPLY-SAME-PARTS  /sy 'S4  /sx 'S4
|-- SUPPLY-SAME-PARTS  /sy 'S5  /sx 'S5

*** 7 judges

|-- PARTS-CONTENTS  /sx 'S1  /sy 'S1  /spy {| /pno [ 'P6 ] [ 'P5 ] [ 'P4 ] [ 'P3 ] [ 'P2 ] [ 'P1 ] |}  /spx {| /pno [ 'P6 ] [ 'P5 ] [ 'P4 ] [ 'P3 ] [ 'P2 ] [ 'P1 ] |}
|-- PARTS-CONTENTS  /sx 'S2  /sy 'S2  /spy {| /pno [ 'P2 ] [ 'P1 ] |}  /spx {| /pno [ 'P2 ] [ 'P1 ] |}
|-- PARTS-CONTENTS  /sx 'S2  /sy 'S3  /spy {| /pno [ 'P1 ] [ 'P2 ] |}  /spx {| /pno [ 'P2 ] [ 'P1 ] |}
|-- PARTS-CONTENTS  /sx 'S3  /sy 'S2  /spy {| /pno [ 'P2 ] [ 'P1 ] |}  /spx {| /pno [ 'P1 ] [ 'P2 ] |}
|-- PARTS-CONTENTS  /sx 'S3  /sy 'S3  /spy {| /pno [ 'P1 ] [ 'P2 ] |}  /spx {| /pno [ 'P1 ] [ 'P2 ] |}

|-- PARTS-CONTENTS  /sx 'S4  /sy 'S4  /spy {| /pno [ 'P5 ] [ 'P4 ] [ 'P2 ] |}  /spx {| /pno [ 'P5 ] [ 'P4 ] [ 'P2 ] |}
|-- PARTS-CONTENTS  /sx 'S5  /sy 'S5  /spy {| /pno |}  /spx {| /pno |}

*** 7 judges

=== note

TABLE : PARTS-CONTENTS

  /sx   /sy   /spy  /spx
  ----- ----- ----- -----
  'S1   'S1   /pno  /pno
              ----- -----
              'P6   'P6
              'P5   'P5
              'P4   'P4
              'P3   'P3
              'P2   'P2
              'P1   'P1
                    
  'S2   'S2   /pno  /pno
              ----- -----
              'P2   'P2
              'P1   'P1
                    
  'S2   'S3   /pno  /pno
              ----- -----
              'P1   'P2
              'P2   'P1
                    
  'S3   'S2   /pno  /pno
              ----- -----
              'P2   'P1
              'P1   'P2
                    
  'S3   'S3   /pno  /pno
              ----- -----
              'P1   'P1
              'P2   'P2
                    
  'S4   'S4   /pno  /pno
              ----- -----
              'P5   'P5
              'P4   'P4
              'P2   'P2
                    
  'S5   'S5   /pno  /pno
              ----  ----
                    

=== rel

**
**  SUMMARY
**       7 judges on PARTS-CONTENTS
**       7 judges on SUPPLY-SAME-PARTS
**      14 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../../dict.sh
```
