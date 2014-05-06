** -*- koshu -*-

s    : source S  /city | rename /sc /city
p    : source P  /city | rename /pc /city

sp   : s | meet p
         | keep /sc > /pc

|== S  : s
|== P  : p
|== SP : sp

