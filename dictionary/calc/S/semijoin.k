** -*- koshu -*-

s    : source S  /sno /sname /status /city
sp   : source SP /sno /pno /qty

ssp  : s | some ( meet sp )
ssp2 : s | some-meet sp

|== SSP  : ssp
|== SSP2 : ssp2

