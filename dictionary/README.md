DICTIONARY
======================

This directory contains examples of Koshucode
translated from C. J. Date's relational database
dictionary.


FILES
----------------------

* File [`SP.d`][SP.d] contains schema in Tutorial D
  and data in tabluar form.
  
* File [`CALC.k`][CALC.k] is a calculation list for examples.
  We can run examples all at once to type command:
  `koshu --calc CALC.k`
  
* File [`DATA.k`][DATA.k] contains a dataset in Koshucode.
  
* File [`WORD.txt`][WORD.txt] is an index of the dictionary.
  
* Files `[a-z]*.k` contains a calculations in Koshucode,
  translated from Date's dictionary.
  Filenames are correspond to heading words in the dictionary.

  
USAGE
----------------------

Run `koshu` command to calculate [`natural-join.k`][natural-join.k]
for dataset [`DATA.k`][DATA.k].

``` sh
koshu natural-join.k DATA.k
```

You can change the order of files.

``` sh
koshu DATA.k natural-join.k
```

Run all examples.

``` sh
koshu --calc CALC.k
```


[SP.d]: SP.d
[CALC.k]: CALC.k
[DATA.k]: DATA.k
[WORD.txt]: WORD.txt
[natural-join.k]: natural-join.k

