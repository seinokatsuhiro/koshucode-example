** -*- koshu -*-

p    : source P  /pno /pname
sp   : source SP /sno /pno /qty

pno  : sp
     | pick /pno
     | group sp -to /r
     | add /qty-list  ( /r/qty )
           /qty-total ( total /r/qty )
     | cut /r
     | meet p

|== P : pno

