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

