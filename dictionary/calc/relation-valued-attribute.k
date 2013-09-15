** -*- koshu -*-

|-- A  /r {| /a  : /b
           | 'A1 : 10
           | 'A2 : 20
           | 'A3 : 30
           |}

|-- A  /r {| /a  : /b
           | 'A4 : 10
           | 'A5 : 20
           |}

|== A
  | source A /r
  | add /size ( length /r )
  | cut /r

