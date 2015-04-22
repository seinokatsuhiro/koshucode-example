** -*- koshu -*-

s    : source S  /sno /sname /status /city
sp   : source SP /sno /pno /qty

ssp  : s | none ( meet sp )
ssp2 : s | none-meet sp

|== SSP  : ssp
|== SSP2 : ssp2

