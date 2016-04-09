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
|== RESTRICTION : call | keep take 1 /name = "B"

**  Figure 8
|== EXTENSION : call | add /init ( take 1 /name )
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
