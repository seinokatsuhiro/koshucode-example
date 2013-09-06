** -*- koshu -*-

s        : source S  /sno /sname /status /city
s-sno    : s | pick /sno
s-sname  : s | pick /sno /sname
s-status : s | pick /sno /status
s-city   : s | pick /sno /city

|== S-SNO    : s-sno
|== S-SNAME  : s-sname
|== S-STATUS : s-status
|== S-CITY   : s-city

