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

