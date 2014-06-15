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

