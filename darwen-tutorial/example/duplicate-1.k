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
|=V DUPLICATE -fore /student-id /name1 :
    call-1 | meet call-2 | keep /name1 <> /name2

