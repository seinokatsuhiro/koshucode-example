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

