#!/usr/bin/env koshu --run
** -*- koshu -*-
**
**  DESCRIPTION
**    Suppliers-and-parts dataset in Koshucode
**
**    This dataset is excerpt from Date's books,
**    e.g., "The Relational Database Dictionary"
**    or "An Introduction to Database Systems",
**    and translates into Koshucode.
**
**  USAGE
**    $ koshu DATA.k natural-join.k
**    $ ./DATA.k natural-join.k
**

**  INTERPRETATION of S
**    <<< Supplier /sno named /sname is under contract.
**        The supplier has status value /status,
**        and is located in the /city. >>>

|-- S  /sno 'S1  /sname 'Smith  /status 20  /city 'London
|-- S  /sno 'S2  /sname 'Jones  /status 10  /city 'Paris
|-- S  /sno 'S3  /sname 'Blake  /status 30  /city 'Paris
|-- S  /sno 'S4  /sname 'Clark  /status 20  /city 'London
|-- S  /sno 'S5  /sname 'Adams  /status 30  /city 'Athens

**  INTERPRETATION of P
**    <<< Parts /pno named /pname are managed.
**        Its color is /color, weight is /weight,
**        and the parts are kept in the /city. >>>

|-- P  /pno 'P1  /pname 'Nut   /color 'Red   /weight 12  /city 'London
|-- P  /pno 'P2  /pname 'Bolt  /color 'Green /weight 17  /city 'Paris
|-- P  /pno 'P3  /pname 'Screw /color 'Blue  /weight 17  /city 'Oslo
|-- P  /pno 'P4  /pname 'Screw /color 'Red   /weight 14  /city 'London
|-- P  /pno 'P5  /pname 'Cam   /color 'Blue  /weight 12  /city 'Paris
|-- P  /pno 'P6  /pname 'Cog   /color 'Red   /weight 19  /city 'London

**  INTERPRETATION of SP
**    <<< Supplier /sno ships parts /pno
**        in the amount of /qty. >>>

|-- SP  /sno 'S1  /pno 'P1  /qty 300
|-- SP  /sno 'S1  /pno 'P2  /qty 200
|-- SP  /sno 'S1  /pno 'P3  /qty 400
|-- SP  /sno 'S1  /pno 'P4  /qty 200
|-- SP  /sno 'S1  /pno 'P5  /qty 100
|-- SP  /sno 'S1  /pno 'P6  /qty 100
|-- SP  /sno 'S2  /pno 'P1  /qty 300
|-- SP  /sno 'S2  /pno 'P2  /qty 400
|-- SP  /sno 'S3  /pno 'P2  /qty 200
|-- SP  /sno 'S4  /pno 'P2  /qty 200
|-- SP  /sno 'S4  /pno 'P4  /qty 300
|-- SP  /sno 'S4  /pno 'P5  /qty 400

