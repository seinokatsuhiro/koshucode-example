** -*- koshu -*-

p     : source P  /pno /pname /color /weight /city
pw    : p | rank /w -order /weight
pq    : pw | keep /w <= 3 | cut /w

|== P : pq

