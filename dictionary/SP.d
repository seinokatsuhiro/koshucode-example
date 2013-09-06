** -*- text -*-
**
**  Schema and data of suppliers-and-parts database
**
**  This database is excerpt from Date's books,
**  e.g., "The Relational Database Dictionary"
**  or "An Introduction to Database Systems".
**


** ******************************************************************
**  Schema in Tutorial D

VAR S BASE RELATION
    { S# S#, SNAME NAME, STATUS INTEGER, CITY CHAR }
      KEY { S# } ;

    ** Supplier S# named SNAME is under contract.
    ** The supplier has status value STATUS,
    ** and is located in the CITY.

VAR P BASE RELATION
    { P# P#, PNAME NAME, COLOR COLOR, WEIGHT WEIGHT, CITY CHAR }
      KEY { P# } ;

    ** Parts P# name PNAME are managed.
    ** Its color is COLOR, weight is WEIGHT,
    ** and the parts are kept in the CITY.

VAR SP BASE RELATION
    { S# S#, P# P#, QTY QTY }
      KEY { S#, P# } ;

    ** Supplier S# ships parts P# in the amount of QTY.


** ******************************************************************
**  Data in tabluar form.

S   S# SNAME STATUS CITY
    == ----- ------ ------
    S1 Smith     20 London
    S2 Jones     10 Paris
    S3 Blake     30 Paris
    S4 Clark     20 London
    S5 Adams     30 Athens

    ** Note: '==' means key of relation

P   P# PNAME COLOR WEIGHT CITY
    == ----- ----- ------ ------
    P1 Nut   Red     12.0 London
    P2 Bolt  Green   17.0 Paris
    P3 Screw Blue    17.0 Oslo
    P4 Screw Red     14.0 London
    P5 Cam   Blue    12.0 Paris
    P6 Cog   Red     19.0 London

SP  S# P# QTY
    == == ---
    S1 P1 300
    S1 P2 200
    S1 P3 400
    S1 P4 200
    S1 P5 100
    S1 P6 100
    S2 P1 300
    S2 P2 400
    S3 P2 200
    S4 P2 200
    S4 P4 300
    S4 P5 400

