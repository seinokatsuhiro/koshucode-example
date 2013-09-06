** -*- koshu -*-

p     : source P  /pno /pname /color /weight /city
pw    : p | rank -add /w -order /weight
pq    : pw | hold /w <= 3 | cut /w

|== P : pq

