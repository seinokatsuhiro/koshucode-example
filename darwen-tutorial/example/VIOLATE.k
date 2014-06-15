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

