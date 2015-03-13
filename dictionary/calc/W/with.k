** -*- koshu -*-
**
**  Get pairs of supplier numbers, /sx and /sy say, such that
**  /sx and /sy each supply exactly the same set of parts.
**

|-- SP  /sno 'S3  /pno 'P1  /qty 200

s    : source S  /sno
sp   : source SP /sno /pno /qty

tx   : s  | rename /sx /sno
ty   : s  | rename /sy /sno
txy  : tx | meet ty

spx  : sp  | rename /sx /sno
spy  : sp  | rename /sy /sno
spxy : txy | some same-parts

same-parts
     : group /spx spx
     | group /spy spy
     | for /spx ( pick /pno )
     | for /spy ( pick /pno )
     | keep /spx = /spy

|== SUPPLY-SAME-PARTS : spxy

|== PARTS-CONTENTS : txy | meet same-parts
  --table --fore /sx /sy

