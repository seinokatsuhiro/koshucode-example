** -*- koshu -*-

|== WORD    : source WORD    /x | add /n ( length /x )
|== HASH    : source HASH    /x | add /n ( length /x )
|== SPECIAL : source SPECIAL /x | add /n ( length /x )
|== UNICODE : source UNICODE /項目名 | add /n ( length /項目名 )
|== ユニコード : source ユニコード /項目名 | add /n ( length /項目名 )


** word

|-- WORD  /x "abc def"   ** comment
|-- WORD  /x ''abc (def) ** not comment
|-- WORD  /x ( 'def )
|-- WORD  /x ( '/y )


** hash text

|-- HASH  /x "abc" #sp "def"
|-- HASH  /x "abc" #cr #lf "def"
|-- HASH  /x "abc'def"
|-- HASH  /x "abc" #qq "def"
|-- HASH  /x "abc	def"    ** tab
|-- HASH  /x "abc#def"
|-- HASH  /x ""


** special character

|-- SPECIAL  /x #(
|-- SPECIAL  /x #)

|-- SPECIAL  /x #[
|-- SPECIAL  /x #]

|-- SPECIAL  /x #{
|-- SPECIAL  /x #}

|-- SPECIAL  /x "/"
|-- SPECIAL  /x "|"
|-- SPECIAL  /x ":"


** unicode

|-- UNICODE  /項目名 '項目内容
|-- ユニコード  /項目名 '項目内容

