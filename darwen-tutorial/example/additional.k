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
|== RESTRICTION :
    call | keep sub-index /name 0 1 = "B"

**  Figure 8
|== EXTENSION -fore /student-id /name :
    call | add /init ( sub-index /name 0 1 )

**  Figure 9
|== SUMMARIZATION -fore /student-id :
    call | pick /student-id
         | group /g enl
         | add /courses ( length /g/course-id )
         | cut /g

**  Figure 10
|== RENAME :
    call | rename /name1 /name

