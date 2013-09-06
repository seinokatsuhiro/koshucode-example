** -*- koshu -*-
**
**  DESCRIPTION
**    Interval selection
**
**  USAGE
**    koshu interval.k
**

|-- DAY  /d 5
|-- DAY  /d 15
|-- DAY  /d 25

day    : source DAY /d
month  : range /m -from 1 -to 12

|== DATE -fore /m /d
  | month
  | meet day

  ** from 7.20 to 10.10
  | add /start-m 7   /end-m 10
        /start-d 20  /end-d 10

  | hold and
    ( /m >= /start-m  and   /m <= /end-m )
    ( /d >= /start-d  when  /m = /start-m )
    ( /d <= /end-d    when  /m = /end-m )

  | cut /start-m /end-m
        /start-d /end-d

