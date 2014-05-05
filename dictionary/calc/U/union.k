** -*- koshu -*-

**  classical set union

s-city : source S /city
p-city : source P /city

|== CITY1 : s-city | join p-city

**  join of relational lattice

s      : source S /sno /sname /status /city
p      : source P /pno /pname /color /weight /city

|== CITY2 : s | join p

