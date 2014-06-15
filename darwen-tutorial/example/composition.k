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
|== JOIN -fore /student-id :
    call | meet enl

**  Figure 5
|== ANTIJOIN :
    call | none ( meet enl )

**  Figure 6

|-- NAME    /name "Boris"
|-- COURSE  /course-id 'C1

r1 : source NAME   /name      | meet call
r2 : source COURSE /course-id | meet enl

|== UNION -order :
    r1 | join r2

