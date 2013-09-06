** -*- koshu -*-
**
**  DESCRIPTION
**    Unicode general categories
**
**  SEE
**    http://www.unicode.org/reports/tr44/
**    5.7.1 General Category Values
**

|-- GENERAL-CATEGORY-GROUP  /group 'L  /long 'letter                 /memset { 'Lu : 'Ll : 'Lt : 'Lm : 'Lo }
|-- GENERAL-CATEGORY-GROUP  /group 'LC /long 'cased-letter           /memset { 'Lu : 'Ll : 'Lt }
|-- GENERAL-CATEGORY        /abbr 'Lu  /long 'uppercase-letter       /desc ''an uppercase letter
|-- GENERAL-CATEGORY        /abbr 'Ll  /long 'lowercase-letter       /desc ''a lowercase letter
|-- GENERAL-CATEGORY        /abbr 'Lt  /long 'titlecase-letter       /desc ''a digraphic character, with first part uppercase
|-- GENERAL-CATEGORY        /abbr 'Lm  /long 'modifier-letter        /desc ''a modifier letter
|-- GENERAL-CATEGORY        /abbr 'Lo  /long 'other-letter           /desc ''other letters, including syllables and ideographs

|-- GENERAL-CATEGORY-GROUP  /group 'M  /long 'mark                   /memset { 'Mn : 'Mc : 'Me }
|-- GENERAL-CATEGORY        /abbr 'Mn  /long 'nonspacing-mark        /desc ''a nonspacing combining mark (zero advance width)
|-- GENERAL-CATEGORY        /abbr 'Mc  /long 'spacing-mark           /desc ''a spacing combining mark (positive advance width)
|-- GENERAL-CATEGORY        /abbr 'Me  /long 'enclosing-mark         /desc ''an enclosing combining mark

|-- GENERAL-CATEGORY-GROUP  /group 'N  /long 'number                 /memset { 'Nd : 'Nl : 'No }
|-- GENERAL-CATEGORY        /abbr 'Nd  /long 'decimal-number         /desc ''a decimal digit
|-- GENERAL-CATEGORY        /abbr 'Nl  /long 'letter-number          /desc ''a letterlike numeric character
|-- GENERAL-CATEGORY        /abbr 'No  /long 'other-number           /desc ''a numeric character of other type

|-- GENERAL-CATEGORY-GROUP  /group 'P  /long 'punctuation            /memset { 'Pc : 'Pd : 'Ps : 'Pe : 'Pi : 'Pf : 'Po }
|-- GENERAL-CATEGORY        /abbr 'Pc  /long 'connector-punctuation  /desc ''a connecting punctuation mark, like a tie
|-- GENERAL-CATEGORY        /abbr 'Pd  /long 'dash-punctuation       /desc ''a dash or hyphen punctuation mark
|-- GENERAL-CATEGORY        /abbr 'Ps  /long 'open-punctuation       /desc ''an opening punctuation mark (of a pair)
|-- GENERAL-CATEGORY        /abbr 'Pe  /long 'close-punctuation      /desc ''a closing punctuation mark (of a pair)
|-- GENERAL-CATEGORY        /abbr 'Pi  /long 'initial-punctuation    /desc ''an initial quotation mark
|-- GENERAL-CATEGORY        /abbr 'Pf  /long 'final-punctuation      /desc ''a final quotation mark
|-- GENERAL-CATEGORY        /abbr 'Po  /long 'other-punctuation      /desc ''a punctuation mark of other type

|-- GENERAL-CATEGORY-GROUP  /group 'S  /long 'symbol                 /memset { 'Sm : 'Sc : 'Sk : 'So }
|-- GENERAL-CATEGORY        /abbr 'Sm  /long 'math-symbol            /desc ''a symbol of mathematical use
|-- GENERAL-CATEGORY        /abbr 'Sc  /long 'currency-symbol        /desc ''a currency sign
|-- GENERAL-CATEGORY        /abbr 'Sk  /long 'modifier-symbol        /desc ''a non-letterlike modifier symbol
|-- GENERAL-CATEGORY        /abbr 'So  /long 'other-symbol           /desc ''a symbol of other type

|-- GENERAL-CATEGORY-GROUP  /group 'Z  /long 'separator              /memset { 'Zs : 'Zl : 'Zp }
|-- GENERAL-CATEGORY        /abbr 'Zs  /long 'space-separator        /desc ''a space character (of various non-zero widths)
|-- GENERAL-CATEGORY        /abbr 'Zl  /long 'line-separator         /desc ''U+2028 LINE SEPARATOR only
|-- GENERAL-CATEGORY        /abbr 'Zp  /long 'paragraph-separator    /desc ''U+2029 PARAGRAPH SEPARATOR only

|-- GENERAL-CATEGORY-GROUP  /group 'C  /long 'other                  /memset { 'Cc : 'Cf : 'Cs : 'Co : 'Cn }
|-- GENERAL-CATEGORY        /abbr 'Cc  /long 'control                /desc ''a C0 or C1 control code
|-- GENERAL-CATEGORY        /abbr 'Cf  /long 'format                 /desc ''a format control character
|-- GENERAL-CATEGORY        /abbr 'Cs  /long 'surrogate              /desc ''a surrogate code point
|-- GENERAL-CATEGORY        /abbr 'Co  /long 'private-use            /desc ''a private-use character
|-- GENERAL-CATEGORY        /abbr 'Cn  /long 'unassigned             /desc ''a reserved unassigned code point or a noncharacter


**  VIEWS

category-group
  | source GENERAL-CATEGORY-GROUP /group /long /memset

category
  | source GENERAL-CATEGORY /abbr /long /desc

group-abbr
  | category-group
  | rename /group-long /long
  | member /abbr /memset
  | meet category
  | rename /abbr-long /long
  | pick /group /group-long /abbr /abbr-long

