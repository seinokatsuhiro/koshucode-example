** -*- koshu -*-

s    : source S  /sno
sp   : source SP /sno /pno /qty

tx   : s  | rename /sx /sno
ty   : s  | rename /sy /sno
txy  : tx | meet ty

|== TXY : txy

