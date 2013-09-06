** -*- koshu -*-
**
**  DESCRIPTION
**    Matrix multiplication
**
**  USAGE
**    koshu MATRIX.k mult.k
**

**** **********************
     a  =  [/a /b /x]
           2  3  4
           1  0  0

     b  =  [/b /c /y]
           0 1000
           1  100
           0   10

     c  =  a * b
        =  [/a /c /z]
           3 2340
           0 1000

mat  | source MATRIX /name /row /col /val

a    | mat
     | hold /name = 'a
     | cut /name
     | rename /a /row
              /b /col
              /x /val

b    | mat
     | hold /name = 'b
     | cut /name
     | rename /b /row
              /c /col
              /y /val

c1   | a
     | meet b
     | add /z ( /x * /y )
     | cut /x /y

c2   | c1
     | pick /a /c

c3   | c2
     | group /r c1
     | add /z ( total /r/z )
     | cut /r

|== A : a
|== B : b
|== C -fore /a /c : c3

