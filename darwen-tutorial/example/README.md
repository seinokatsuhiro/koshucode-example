# I/O List

- [DATA.k](#datak)
- koshu DATA.k [projection.k](#projectionk)
- koshu DATA.k [composition.k](#compositionk)
- koshu DATA.k [additional.k](#additionalk)
- koshu DATA.k [duplicate-1.k](#duplicate-1k)
- koshu DATA.k [VIOLATE.k duplicate-1.k](#violatek-duplicate-1k)
- koshu DATA.k [duplicate-2.k](#duplicate-2k)
- koshu DATA.k [VIOLATE.k duplicate-2.k](#violatek-duplicate-2k)
- koshu DATA.k [exclusion.k](#exclusionk)
- koshu DATA.k [VIOLATE.k exclusion.k](#violatek-exclusionk)



## [DATA.k](DATA.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Sample dataset
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k additional.k
**

**  INTERPRETATION of ENROLMENT
**    Student /student-id, named /name,
**    is enrolled on course /coousr-id.

|-- ENROLMENT  /student-id 'S1  /name "Anne"      /course-id 'C1
|-- ENROLMENT  /student-id 'S1  /name "Anne"      /course-id 'C2
|-- ENROLMENT  /student-id 'S2  /name "Boris"     /course-id 'C1
|-- ENROLMENT  /student-id 'S3  /name "Cindy"     /course-id 'C3
|-- ENROLMENT  /student-id 'S4  /name "Devinder"  /course-id 'C1

**  INTERPRETATION of IS-CALLED
**    Student /student-id is called /name.

|-- IS-CALLED  /student-id 'S1  /name "Anne"
|-- IS-CALLED  /student-id 'S2  /name "Boris"
|-- IS-CALLED  /student-id 'S3  /name "Cindy"
|-- IS-CALLED  /student-id 'S4  /name "Devinder"
|-- IS-CALLED  /student-id 'S5  /name "Boris"

**  INTERPRETATION of IS-ENROLLED-ON
**    Student /student-id is enrolled on course /course-id.

|-- IS-ENROLLED-ON  /student-id 'S1  /course-id 'C1
|-- IS-ENROLLED-ON  /student-id 'S1  /course-id 'C2
|-- IS-ENROLLED-ON  /student-id 'S2  /course-id 'C1
|-- IS-ENROLLED-ON  /student-id 'S3  /course-id 'C3
|-- IS-ENROLLED-ON  /student-id 'S4  /course-id 'C1

```



## projection.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Projection operators
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k projection.k
**

enl : source ENROLMENT /student-id /name /course-id

**  Figure 3
|== PICK : enl | pick /student-id /name

**  Figure 3 (continued)
|== CUT : enl | cut /name

**  Projection over no attributes
|== NULLARY : enl | pick

```

Command `koshu DATA.k projection.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    projection.k
**
**  OUTPUT
**    <stdout>
**

|-- PICK  /student-id 'S1  /name 'Anne
|-- PICK  /student-id 'S2  /name 'Boris
|-- PICK  /student-id 'S3  /name 'Cindy
|-- PICK  /student-id 'S4  /name 'Devinder

*** 4 judges

|-- CUT  /student-id 'S1  /course-id 'C1
|-- CUT  /student-id 'S1  /course-id 'C2
|-- CUT  /student-id 'S2  /course-id 'C1
|-- CUT  /student-id 'S3  /course-id 'C3
|-- CUT  /student-id 'S4  /course-id 'C1

*** 5 judges

|-- NULLARY

*** 1 judge 

**
**  SUMMARY
**       5 judges on CUT
**       1 judge  on NULLARY
**       4 judges on PICK
**      10 judges in total
**
```



## composition.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Composition operators
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k composition.k
**

call : source IS-CALLED /student-id /name
enl  : source IS-ENROLLED-ON /student-id /course-id

**  Figure 4
|== JOIN : call | meet enl  --forward /student-id

**  Figure 5
|== ANTIJOIN : call | none ( meet enl )

**  Figure 6

|-- NAME    /name "Boris"
|-- COURSE  /course-id 'C1

r1 : source NAME   /name      | meet call
r2 : source COURSE /course-id | meet enl

|== UNION : r1 | join r2  --order
```

Command `koshu DATA.k composition.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    composition.k
**
**  OUTPUT
**    <stdout>
**

|-- JOIN  /student-id 'S1  /course-id 'C2  /name 'Anne
|-- JOIN  /student-id 'S1  /course-id 'C1  /name 'Anne
|-- JOIN  /student-id 'S2  /course-id 'C1  /name 'Boris
|-- JOIN  /student-id 'S3  /course-id 'C3  /name 'Cindy
|-- JOIN  /student-id 'S4  /course-id 'C1  /name 'Devinder

*** 5 judges

|-- ANTIJOIN  /student-id 'S5  /name 'Boris

*** 1 judge 

|-- UNION  /student-id 'S1
|-- UNION  /student-id 'S2
|-- UNION  /student-id 'S4
|-- UNION  /student-id 'S5

*** 4 judges

**
**  SUMMARY
**       1 judge  on ANTIJOIN
**       5 judges on JOIN
**       4 judges on UNION
**      10 judges in total
**
```



## additional.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Additional operators
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k additional.k
**

call : source IS-CALLED /student-id /name
enl  : source IS-ENROLLED-ON /student-id /course-id

**  Figure 7
|== RESTRICTION : call | keep sub-index /name 0 1 = "B"

**  Figure 8
|== EXTENSION : call | add /init ( sub-index /name 0 1 )
  --forward /student-id /name

**  Figure 9
|== SUMMARIZATION
  : call
  | pick /student-id
  | group enl -to /g
  | add /courses ( length /g/course-id )
  | cut /g
  --forward /student-id

**  Figure 10
|== RENAME : call | rename /name1 /name
```

Command `koshu DATA.k additional.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    additional.k
**
**  OUTPUT
**    <stdout>
**

|-- RESTRICTION  /student-id 'S2  /name 'Boris
|-- RESTRICTION  /student-id 'S5  /name 'Boris

*** 2 judges

|-- EXTENSION  /student-id 'S1  /name 'Anne  /init 'A
|-- EXTENSION  /student-id 'S2  /name 'Boris  /init 'B
|-- EXTENSION  /student-id 'S3  /name 'Cindy  /init 'C
|-- EXTENSION  /student-id 'S4  /name 'Devinder  /init 'D
|-- EXTENSION  /student-id 'S5  /name 'Boris  /init 'B

*** 5 judges

|-- SUMMARIZATION  /student-id 'S1  /courses 2
|-- SUMMARIZATION  /student-id 'S2  /courses 1
|-- SUMMARIZATION  /student-id 'S3  /courses 1
|-- SUMMARIZATION  /student-id 'S4  /courses 1
|-- SUMMARIZATION  /student-id 'S5  /courses 0

*** 5 judges

|-- RENAME  /student-id 'S1  /name1 'Anne
|-- RENAME  /student-id 'S2  /name1 'Boris
|-- RENAME  /student-id 'S3  /name1 'Cindy
|-- RENAME  /student-id 'S4  /name1 'Devinder
|-- RENAME  /student-id 'S5  /name1 'Boris

*** 5 judges

**
**  SUMMARY
**       5 judges on EXTENSION
**       5 judges on RENAME
**       2 judges on RESTRICTION
**       5 judges on SUMMARIZATION
**      17 judges in total
**
```



## duplicate-1.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k [VIOLATE.k] duplicated-1.k
**

call : source IS-CALLED /student-id /name

**  Figure 11
call-1 : call | rename /name1 /name
call-2 : call | rename /name2 /name

** |=V checks relation is empty.
|=V DUPLICATE : call-1 | meet call-2 | keep /name1 <> /name2
  --forward /student-id /name1

```

Command `koshu DATA.k duplicate-1.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    duplicate-1.k
**
**  OUTPUT
**    <stdout>
**

**
**  SUMMARY
**      no judges on DUPLICATE
**      no judges in total
**
```



## VIOLATE.k duplicate-1.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**

**  Duplicated /student-id
|-- IS-CALLED  /student-id 'S1  /name "Eva"

**  Unregistered /student-id
|-- IS-ENROLLED-ON  /student-id 'S6  /course-id 'C1

```
```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k [VIOLATE.k] duplicated-1.k
**

call : source IS-CALLED /student-id /name

**  Figure 11
call-1 : call | rename /name1 /name
call-2 : call | rename /name2 /name

** |=V checks relation is empty.
|=V DUPLICATE : call-1 | meet call-2 | keep /name1 <> /name2
  --forward /student-id /name1

```

Command `koshu DATA.k VIOLATE.k duplicate-1.k` exits with 1 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    VIOLATE.k
**    duplicate-1.k
**
**  OUTPUT
**    <stdout>
**

|-V DUPLICATE  /student-id 'S1  /name1 'Anne  /name2 'Eva
|-V DUPLICATE  /student-id 'S1  /name1 'Eva  /name2 'Anne

*** 2 judges

**
**  SUMMARY (VIOLATED)
**       2 judges on DUPLICATE
**       2 judges in total
**
```



## duplicate-2.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k [VIOLATE.k] duplicated-2.k
**

call : source IS-CALLED /student-id /name

**  Figure 11 (simplified)
|=V DUPLICATE : call | duplicate /student-id
  --forward /student-id /name

```

Command `koshu DATA.k duplicate-2.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    duplicate-2.k
**
**  OUTPUT
**    <stdout>
**

**
**  SUMMARY
**      no judges on DUPLICATE
**      no judges in total
**
```



## VIOLATE.k duplicate-2.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**

**  Duplicated /student-id
|-- IS-CALLED  /student-id 'S1  /name "Eva"

**  Unregistered /student-id
|-- IS-ENROLLED-ON  /student-id 'S6  /course-id 'C1

```
```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k [VIOLATE.k] duplicated-2.k
**

call : source IS-CALLED /student-id /name

**  Figure 11 (simplified)
|=V DUPLICATE : call | duplicate /student-id
  --forward /student-id /name

```

Command `koshu DATA.k VIOLATE.k duplicate-2.k` exits with 1 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    VIOLATE.k
**    duplicate-2.k
**
**  OUTPUT
**    <stdout>
**

|-V DUPLICATE  /student-id 'S1  /name 'Eva
|-V DUPLICATE  /student-id 'S1  /name 'Anne

*** 2 judges

**
**  SUMMARY (VIOLATED)
**       2 judges on DUPLICATE
**       2 judges in total
**
```



## exclusion.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k [VIOLATE.k] exclusion.k
**

call : source IS-CALLED /student-id
enl  : source IS-ENROLLED-ON /student-id

**  Inclusion dependency
|=V EXCLUDE :
    enl | none ( sub call )

```

Command `koshu DATA.k exclusion.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    exclusion.k
**
**  OUTPUT
**    <stdout>
**

**
**  SUMMARY
**      no judges on EXCLUDE
**      no judges in total
**
```



## VIOLATE.k exclusion.k

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**

**  Duplicated /student-id
|-- IS-CALLED  /student-id 'S1  /name "Eva"

**  Unregistered /student-id
|-- IS-ENROLLED-ON  /student-id 'S6  /course-id 'C1

```
```
** -*- koshu -*-
**
**  DESCRIPTION
**    Database integrity
**    excerpt from "The Relational Model: a Tutorial"
**    by Hugh Darwen
**
**  USAGE
**    koshu DATA.k [VIOLATE.k] exclusion.k
**

call : source IS-CALLED /student-id
enl  : source IS-ENROLLED-ON /student-id

**  Inclusion dependency
|=V EXCLUDE :
    enl | none ( sub call )

```

Command `koshu DATA.k VIOLATE.k exclusion.k` exits with 1 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    VIOLATE.k
**    exclusion.k
**
**  OUTPUT
**    <stdout>
**

|-V EXCLUDE  /student-id 'S6

*** 1 judge 

**
**  SUMMARY (VIOLATED)
**       1 judge  on EXCLUDE
**       1 judge  in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -f ARG koshu DATA.k
```
